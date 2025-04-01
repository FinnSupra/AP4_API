<?php

use App\Database;

return [

    Database::class => function(){
        return new Database(host: '127.0.0.1', name: 'w639v7_ppe4', username: 'root', password: '');
    }
];