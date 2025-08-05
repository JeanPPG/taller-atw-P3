<?php

declare(strict_types=1);

namespace App\Controllers;
use App\Repositories\BookRepository;
use App\Repositories\AuthorRepository;
use App\Entities\Book;
use App\Entities\Author;

class BookController {
    private BookRepository $bookRepository;
    private AuthorRepository $authorRepository;

    public function __construct() {
        $this->bookRepository = new BookRepository();
        $this->authorRepository = new AuthorRepository();
    }

    public function handle(): void{
        header('Content-Type: application/json');
        $method = $_SERVER['REQUEST_METHOD'];
        
        if ($method === 'GET') {

            if (isset($_GET['id'])) {
                $book = $this->bookRepository->findById((int)$_GET['id']);
                echo json_encode($book ? $this->bookToArray($book) : null);
            } else {
                $list = array_map([$this, 'bookToArray'], $this->bookRepository->findAll());
                echo json_encode($list);
            }
            return;
        }

        $payload = json_decode(file_get_contents('php://input'), true);

        if ($method === 'POST') {
            $author = $this->authorRepository->findById((int)$payload['authorId'] ?? 0);
            //debug payloads

            if (!$author) {
                http_response_code(400);
                echo json_encode(['error' => 'Author not found']);
                return;
            }
            $book = new Book(
                0,
                $payload['title'],
                $payload['description'],
                new \DateTime($payload['publication_date'] ?? 'now'),
                $author,
                $payload['isbn'],
                $payload['genre'],
                $payload['edition']
            );

            echo json_encode(['success' => $this->bookRepository->create($book)]);
            return;
        }

        if ($method === 'PUT') {
            $id = (int)($payload['id'] ?? 0);
            $existing = $this->bookRepository->findById($id);
            if (!$existing) {
                http_response_code(404);
                echo json_encode(['error' => 'Book not found']);
                return;
            }
            if(isset($payload['authorId'])) 
             {
                $author = $this->authorRepository->findById((int)$payload['authorId']);
                if($author) {
                    $existing->setAuthor($author);
                } else {
                    http_response_code(400);
                    echo json_encode(['error' => 'Author not found']);
                    return;
                }
            }
            if(isset($payload['title'])) {
                $existing->setTitle($payload['title']);
            }
            if(isset($payload['description'])) {
                $existing->setDescription($payload['description']);
            }
            if(isset($payload['publication_date'])) {
                $existing->setPublicationDate(new \DateTime($payload['publication_date']));
            }
            if(isset($payload['isbn'])) {
                $existing->setIsbn($payload['isbn']);
            }
            if(isset($payload['genre'])) {
                $existing->setGenre($payload['genre']);
            }
            if(isset($payload['edition'])) {
                $existing->setEdition((int)$payload['edition']);
            }
              
            echo json_encode(['success' => $this->bookRepository->update($existing)]);
            return;
        }

        if ($method === 'DELETE') {
            $payload = json_decode(file_get_contents('php://input'), true);
            $id = (int)($payload['id'] ?? 0);
            $existing = $this->bookRepository->delete($id);
            echo json_encode(['success' => $existing]);
            return;
        }

        http_response_code(405); // Method Not Allowed
        echo json_encode(['error' => 'Method not allowed']);
    }

    public function bookToArray(Book $book): array {
        return [
            'id' => $book->getId(),
            'title' => $book->getTitle(),
            'description' => $book->getDescription(),
            'publication_date' => $book->getPublicationDate(),
            'author' => [
                'id' => $book->getAuthor()->getId(),
                'firstname' => $book->getAuthor()->getFirstName(),
                'lastname' => $book->getAuthor()->getLastName()
            ],
            'isbn' => $book->getIsbn(),
            'genre' => $book->getGenre(),
            'edition' => $book->getEdition()
        ];
    }
}
