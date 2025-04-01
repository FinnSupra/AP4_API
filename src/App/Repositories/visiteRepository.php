<?php

declare(strict_types=1);

namespace App\Repositories;

use App\Database;
use PDO;

class visiteRepository
{
    public function __construct(private Database $database)
    {
    }

    public function getAll() :  array
    {
        $pdo = $this->database->getConnection();

        $stmt = $pdo->query('SELECT * FROM visite');
       
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
    public function getById(int $id): array|bool
    {
        $sql = 'SELECT * FROM visite WHERE id = :id';
        $pdo = $this->database->getConnection();
        $stmt = $pdo->prepare($sql);
        $stmt->bindValue(':id', $id, PDO::PARAM_INT);
        $stmt->execute();
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }
    public function getByInf(int $idInf): array
    {
        $sql = 'SELECT * FROM visite WHERE infirmiere = :idInf';
        $pdo = $this->database->getConnection();
        $stmt = $pdo->prepare($sql);
        $stmt->bindValue(':idInf', $idInf, PDO::PARAM_INT);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
    public function getByPat(int $idPat): array
    {
        $sql = 'SELECT * FROM visite WHERE patient = :idPat';
        $pdo = $this->database->getConnection();
        $stmt = $pdo->prepare($sql);
        $stmt->bindValue(':idPat', $idPat, PDO::PARAM_INT);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
    public function create(array $data): string
    {
        $sql = 'INSERT INTO visite (patient, infirmiere, date_prevue, date_reelle, duree, compte_rendu_infirmiere, compte_rendu_patient)
                VALUES (:patient, :infirmiere, :date_prevue, :date_reelle, :duree, :compte_rendu_infirmiere, :compte_rendu_patient)';
        
        $pdo = $this->database->getConnection();

        $stmt = $pdo->prepare($sql);

        $stmt->bindValue(':patient', $data['patient'], PDO::PARAM_INT);
        $stmt->bindValue(':infirmiere', $data['infirmiere'], PDO::PARAM_INT);
        $stmt->bindValue(':date_prevue', $data['date_prevue'], PDO::PARAM_STR);
        $stmt->bindValue(':date_reelle', $data['date_reelle'], PDO::PARAM_STR);


        $stmt->bindValue(':date_reelle', $data['date_reelle'], PDO::PARAM_INT);
        $stmt->bindValue(':duree', $data['duree'], PDO::PARAM_INT);
        if (empty($data['compte_rendu_infirmiere'])){
            $stmt->bindValue(':compte_rendu_infirmiere', null, PDO::PARAM_INT);
        }
        else{
            $stmt->bindValue(':compte_rendu_infirmiere', $data['compte_rendu_infirmiere'], PDO::PARAM_STR);
        }
        if (empty($data['compte_rendu_patient'])){
            $stmt->bindValue(':compte_rendu_patient', null, PDO::PARAM_INT);
        }
        else{
            $stmt->bindValue(':compte_rendu_patient', $data['compte_rendu_patient'], PDO::PARAM_STR);
        }
        $stmt->execute();

        return $pdo->lastInsertId();
    }
    public function update(int $id, array $data): int
    {
        $sql = 'UPDATE visite
                SET patient = :patient,
                    infirmiere = :infirmiere,
                    date_prevue = :date_prevue,
                    date_reelle = :date_reelle,
                    duree = :duree,
                    compte_rendu_infirmiere = :compte_rendu_infirmiere,
                    compte_rendu_patient = :compte_rendu_patient
                WHERE id = :id';
        
        $pdo = $this->database->getConnection();

        $stmt = $pdo->prepare($sql);

        $stmt->bindValue(':patient', $data['patient'], PDO::PARAM_INT);
        $stmt->bindValue(':infirmiere', $data['infirmiere'], PDO::PARAM_INT);
        $stmt->bindValue(':date_prevue', $data['date_prevue'], PDO::PARAM_STR);
        $stmt->bindValue(':date_reelle', $data['date_reelle'], PDO::PARAM_STR);


        $stmt->bindValue(':date_reelle', $data['date_reelle'], PDO::PARAM_INT);
        $stmt->bindValue(':duree', $data['duree'], PDO::PARAM_INT);
        if (empty($data['compte_rendu_infirmiere'])){
            $stmt->bindValue(':compte_rendu_infirmiere', null, PDO::PARAM_INT);
        }
        else{
            $stmt->bindValue(':compte_rendu_infirmiere', $data['compte_rendu_infirmiere'], PDO::PARAM_STR);
        }
        if (empty($data['compte_rendu_patient'])){
            $stmt->bindValue(':compte_rendu_patient', null, PDO::PARAM_INT);
        }
        else{
            $stmt->bindValue(':compte_rendu_patient', $data['compte_rendu_patient'], PDO::PARAM_STR);
        }
        $stmt->bindValue(':id', $id, PDO::PARAM_INT);

        $stmt->execute();

        return $stmt->rowCount();
    }
    public function delete(string $id): int
    {
        $sql = 'DELETE FROM visite
                WHERE id = :id';
        $pdo = $this->database->getConnection();
        $stmt = $pdo->prepare($sql);
        $stmt->bindValue(':id', $id, PDO::PARAM_INT);
        $stmt->execute();
        return $stmt->rowCount();
    }
}