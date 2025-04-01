<?php

declare(strict_types=1);

namespace App\Repositories;

use App\Database;
use PDO;
use Firebase\JWT\JWT;
use Firebase\JWT\Key;

class loginRepository
{
    private $login;
    private $mdp;
    private $id;

    public function __construct(private Database $database)
    {
    }

    public function login(array $data)
    {
        $id = 0;
        // Initialiser les propriétés de la classe
        $this->login = $data['login'] ?? '';
        $this->mdp = $data['mp'] ?? '';

        $mdpHashed = md5($this->mdp);

        $sql = 'SELECT * FROM personne_login
                WHERE login = :login AND mp = :mp';

        $pdo = $this->database->getConnection();

        $stmt = $pdo->prepare($sql);

        // Utiliser les propriétés de la classe
        $stmt->bindValue(':login', $this->login, PDO::PARAM_STR);
        $stmt->bindValue(':mp', $mdpHashed, PDO::PARAM_STR);

        $stmt->execute();

        $user = $stmt->fetch(PDO::FETCH_ASSOC);
        // Test role 
        if ($user == true){
            $sql = 'SELECT * FROM administrateur
                    WHERE id = :id';
            $pdo = $this->database->getConnection();
            $stmt = $pdo->prepare($sql);
            $stmt->bindValue(':id', $user['id'], PDO::PARAM_INT);
            $stmt->execute();
            $userAdmin = $stmt->fetch(PDO::FETCH_ASSOC);
            // Test admin
            if ($userAdmin !== false){
                $id = 4;
            }
            else{
                $sql = 'SELECT * FROM infirmiere
                        WHERE id = :id';
                $pdo = $this->database->getConnection();
                $stmt = $pdo->prepare($sql);
                $stmt->bindValue(':id', $user['id'], PDO::PARAM_INT);
                $stmt->execute();
                $userInf = $stmt->fetch(PDO::FETCH_ASSOC);
                $id = 5;
                // Test infirmiere
                if ($userInf !== false){
                    $id = 1;
                    // Test infirmiere en chef
                    if ($userInf['infChef'] == true){
                        $id = 2;
                    }
                }
                // Test patient
                else{
                    $sql = 'SELECT * FROM patient
                            WHERE id = :id';
                    $pdo = $this->database->getConnection();
                    $stmt = $pdo->prepare($sql);
                    $stmt->bindValue(':id', $user['id'], PDO::PARAM_INT);
                    $stmt->execute();
                    $userPatient = $stmt->fetch(PDO::FETCH_ASSOC);
                    if ($userPatient !== false){
                        $id = 3;
                    }
                }
            }

        }
        $JWT = $this->createJWT($id, $user['id']);
        return $JWT;
    }
    public function createJWT($idRole, $idPers)
    {
        $key = 'BTS-SIO';
        $issuedAt = time();
        $expirationTime = $issuedAt + (5 * 60);

        $payload = [
            'iat' => $issuedAt,         // Temps d'émission
            'exp' => $expirationTime,   // Temps d'expiration
            'id' => $idRole,            // Identifiant du role
            'idPers' => $idPers         // Identifiant de la personne connecté
        ];

        $jwt = JWT::encode($payload, $key, 'HS256');
        return $jwt;
    }
}
