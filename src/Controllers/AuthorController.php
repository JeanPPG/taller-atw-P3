<?php

declare(strict_types=1);

namespace App\Controllers;

use App\Repositories\AuthorRepository;
use App\Entities\Author;

class AuthorController
{
    private AuthorRepository $authorRepository;

    public function __construct()
    {
        $this->authorRepository = new AuthorRepository();
    }

    public function handle(): void
    {
        header('Content-Type: application/json');
        $method = $_SERVER['REQUEST_METHOD'];

        if ($method === 'GET') {

            if (isset($_GET['id'])) {
                $author = $this->authorRepository->findById((int)$_GET['id']);
                echo json_encode($author ? $this->authorToArray($author) : null);
            } else {
                $list = array_map([$this, 'authorToArray'], $this->authorRepository->findAll());
                echo json_encode($list);
            }
            return;
        }

        $payload = json_decode(file_get_contents('php://input'), true);

        if ($method === 'POST') {
            $author = new Author(
                0,
                $payload['first_name'],
                $payload['last_name'],
                $payload['username'],
                $payload['email'],
                password_hash($payload['password'], PASSWORD_BCRYPT),
                $payload['orcid'],
                $payload['afiliation']
            );

            echo json_encode(['success' => $this->authorRepository->create($author)]);
            return;
        }

        if ($method === 'PUT') {
            if (isset($payload['id'])) {

                http_response_code(404);
                echo json_encode(['error' => 'Author not found']);
                return;
            }
            $author = $this->authorRepository->findById((int)$payload['id']);
            $author->setFirstName($payload['first_name'] ?? $author->getFirstName());
            $author->setLastName($payload['last_name'] ?? $author->getLastName());
            $author->setUsername($payload['username'] ?? $author->getUsername());
            $author->setEmail($payload['email'] ?? $author->getEmail());
            $author->setOrcid($payload['orcid'] ?? $author->getOrcid());
            $author->setAfiliation($payload['afiliation'] ?? $author->getAfiliation());
            echo json_encode(['success' => $this->authorRepository->update($author)]);
            return;
        }

        if ($method === 'DELETE') {
            $payload = json_decode(file_get_contents('php://input'), true);
            $id = (int)($payload['id'] ?? 0);
            $existing = $this->authorRepository->delete($id);
            echo json_encode(['success' => $existing]);
            return;
        }

        http_response_code(405);
        echo json_encode(['error' => 'Method not allowed']);
    }

    private function authorToArray(Author $author): array
    {
        return [
            'id'         => $author->getId(),
            'first_name' => $author->getFirstName(),
            'last_name'  => $author->getLastName(),
            'username'   => $author->getUsername(),
            'email'      => $author->getEmail(),
            'orcid'      => $author->getOrcid(),
            'afiliation' => $author->getAfiliation()
        ];
    }
}
