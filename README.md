# API de Gestion des Visites Médicales

Une API RESTful développée avec le framework Slim (PHP) pour la gestion des visites médicales dans un environnement hospitalier.

## Prérequis

- PHP 8.0+
- Composer
- WAMP/MAMP/LAMP (avec PHPMyAdmin)
- Postman ou un client API similaire

## Installation

1. Cloner le dépôt :
   ```bash
   git clone https://github.com/FinnSupra/AP4_API.git
   ```
   
2. Importer la base de données :
   - Importer le fichier `w639v7_ppe4.sql` dans PHPMyAdmin

3. Démarrer le serveur :
   ```bash
   php -S localhost:8080 -t public
   ```

## Authentification

L'API utilise JWT pour l'authentification. Pour obtenir un token :

1. Envoyer une requête POST à `/login` avec :
   ```json
   {
     "login": "identifiant",
     "password": "motdepasse"
   }
   ```

2. Utiliser le token reçu dans le header `Authorization` des requêtes suivantes :
   ```
   Authorization: Bearer VOTRE_TOKEN_JWT
   ```

## Comptes de Test

| Rôle                | Login         | Mot de passe  |
|---------------------|---------------|---------------|
| Infirmière en chef  | fnightingale  | fnightingale  |
| Infirmière          | lwald         | lwald         |
| Infirmière          | vhenderson    | vhenderson    |
| Infirmière          | jeanne        | jeanne        |
| Infirmière          | kilian        | kilian        |
| Administrateur      | jboullier     | jboullier     |
| Administrateur      | mmolaire      | mmolaire      |
| Patient             | glagaffe      | glagaffe      |
| Patient             | fantasio      | fantasio      |
| Patient             | prunelle      | prunelle      |
| Patient             | ademesmaeker  | ademesmaeker  |
| Patient             | mmolaire      | mmolaire      |
| Patient             | blabévue      | blabévue      |
| Patient             | jsoutier      | jsoutier      |
| Patient             | jlongtarin    | jlongtarin    |
| Patient             | gustave       | gustave       |


## Routes de l'API

### Authentification
- `POST /login` - Authentification et récupération du token JWT

### Visites (nécessite un token JWT valide)

#### Pour toutes les infirmières
- `GET /api/visites` - Récupère toutes les visites (accès restreint selon le rôle)
- `POST /api/visite` - Crée une nouvelle visite (spécification dans le body)

#### Pour une visite spécifique
- `GET /api/visite/{id}` - Récupère une visite spécifique
- `PUT /api/visite/{id}` - Met à jour une visite
- `DELETE /api/visite/{id}` - Supprime une visite

#### Pour les visites d'une infirmière spécifique
- `GET /api/visites/{idInf}` - Récupère les visites d'une infirmière spécifique

## Permissions selon les rôles

- **Infirmière normale** :
  - Peut voir seulement ses propres visites
  - Peut créer de nouvelles visites

- **Infirmière en chef** :
  - Peut voir toutes les visites
  - Peut voir les visites d'une infirmière spécifique
  - Peut modifier/supprimer des visites

## Utilisation avec Postman

1. Importez la collection Postman fournie (si disponible)
2. Commencez par une requête POST vers `/login` pour obtenir votre token JWT
3. Utilisez ce token dans le header `Authorization` des requêtes suivantes
4. Testez les différentes routes selon votre rôle

## Exemple de Requêtes

### Création d'une visite
```http
POST /api/visite
Content-Type: application/json
Authorization: Bearer VOTRE_TOKEN_JWT

{
  "date_visite": "2023-05-15",
  "heure_visite": "14:30:00",
  "id_patient": 1,
  "id_infirmiere": 2,
  "soins": "Pansement à changer"
}
```

### Récupération des visites d'une infirmière
```http
GET /api/visites/3
Authorization: Bearer VOTRE_TOKEN_JWT
```

## Structure de la Base de Données

L'API à accès aux tables :
- `visites`
- `infirmieres`
- `patients`
- `administrateur`

Le fichier SQL complet est disponible dans `w639v7_ppe4.sql`.
