<?php
declare(strict_types=1);

namespace App\Controllers;
use App\Repositories\ArticleRepository;
use App\Repositories\AuthorRepository;
use App\Entities\Article;
use App\Entities\Author;

class ArticleController {
    private ArticleRepository $articleRepository;
    private AuthorRepository $authorRepository;

    public function __construct() {
        $this->articleRepository = new ArticleRepository();
        $this->authorRepository = new AuthorRepository();
    }

    public function handle(): void {
        header('Content-Type: application/json');
        $method = $_SERVER['REQUEST_METHOD'];

        if ($method === 'GET') {
            if (isset($_GET['id'])) {
                $article = $this->articleRepository->findById((int)$_GET['id']);
                echo json_encode($article ? $this->articleToArray($article) : null);
            } else {
                $list = array_map([$this, 'articleToArray'], $this->articleRepository->findAll());
                echo json_encode($list);
            }
            return;
        }

        $payload = json_decode(file_get_contents('php://input'), true);

        if ($method === 'POST') {
            $author = $this->authorRepository->findById((int)$payload['author_id'] ?? 0);
            if (!$author) {
                http_response_code(400);
                echo json_encode(['error' => 'Author not found']);
                return;
            }
            $article = new Article(
                0,
                $payload['title'],
                $payload['description'],
                new \DateTime($payload['publication_date'] ?? 'now'),
                $author,
                $payload['doi'],
                $payload['abstract'],
                $payload['keywords'],
                $payload['indexation'],
                $payload['magazine'],
                $payload['area']
            );

            echo json_encode(['success' => $this->articleRepository->create($article)]);
            return;
        }

        if($method === 'PUT') {
            if (!isset($_GET['id'])) {
                http_response_code(400);
                echo json_encode(['error' => 'Article ID is required']);
                return;
            }
            $article = $this->articleRepository->findById((int)$_GET['id']);
            if (!$article) {
                http_response_code(404);
                echo json_encode(['error' => 'Article not found']);
                return;
            }

            $author = $this->authorRepository->findById((int)$payload['author_id'] ?? 0);
            if (!$author) {
                http_response_code(400);
                echo json_encode(['error' => 'Author not found']);
                return;
            }

            if (isset($payload['title'])) {
                $article->setTitle($payload['title']);
            }
            if (isset($payload['description'])) {
                $article->setDescription($payload['description']);
            }
            if (isset($payload['publication_date'])) {
                $article->setPublicationDate(new \DateTime($payload['publication_date']));
            }
            $article->setAuthor($author);
            if (isset($payload['doi'])) {
                $article->setDoi($payload['doi']);
            }
            if (isset($payload['abstract'])) {
                $article->setAbstract($payload['abstract']);
            }
            if (isset($payload['keywords'])) {
                $article->setKeywords($payload['keywords']);
            }
            if (isset($payload['indexation'])) {
                $article->setIndexation($payload['indexation']);
            }
            if (isset($payload['magazine'])) {
                $article->setMagazine($payload['magazine']);
            }
            if (isset($payload['area'])) {
                $article->setArea($payload['area']);
            }
            if (isset($payload['id'])) {
                $article->setId((int)$payload['id']);
            }

            echo json_encode(['success' => $this->articleRepository->update($article)]);
            return;
        }
        
        if($method === 'DELETE') {
            $payload = json_decode(file_get_contents('php://input'), true);
            $id = (int)($payload['id'] ?? 0);
            $existing = $this->articleRepository->delete($id);
            echo json_encode(['success' => $existing]);
            return;
        }

        http_response_code(405);
        echo json_encode(['error' => 'Method not allowed']);
    }


    public function articleToArray(Article $article): array {
        return [
            'id' => $article->getId(),
            'title' => $article->getTitle(),
            'description' => $article->getDescription(),
            'publication_date' => $article->getPublicationDate(),
            'author' => [
                'id' => $article->getAuthor()->getId(),
                'firstname' => $article->getAuthor()->getFirstName(),
                'lastname' => $article->getAuthor()->getLastName()
            ],
            'doi' => $article->getDoi(),
            'abstract' => $article->getAbstract(),
            'keywords' => $article->getKeywords(),
            'indexation' => $article->getIndexation(),
            'magazine' => $article->getMagazine(),
            'area' => $article->getArea()
        ];
    }
}