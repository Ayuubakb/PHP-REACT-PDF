<?php

    require('../utils/cors.php');
    require('../utils/connexion.php');

    $conn=setConnection();

    $file=file_get_contents('php://input');
    $data=json_decode($file);
    $id=$data->Id;
    $query="";
    if(strcmp($id,"") && strcmp($id," ")){
        $query="SELECT id ,id_client, type, description, date_reclamation as dateRec
        FROM reclamation Where id_client=$id and statu=0 ORDER BY id desc";
    }else{
        $query="SELECT id ,id_client, type, description, date_reclamation as dateRec
        FROM reclamation Where statu=0 ORDER BY id desc";
    }
    
    $getRec=mysqli_query($conn,$query);

    $tab=array();
    while($row=mysqli_fetch_assoc($getRec)){
        $object=new stdClass();
        $object->id=$row['id'];
        $object->type=$row['type'];
        $object->description=$row['description'];
        $object->dateRec=$row['dateRec'];
        $object->idClient=$row['id_client'];

        $tab[]=$object;
    }

    $objctF=new stdClass();
    $objctF->data=$tab;
    $objctF=json_encode($objctF);

    echo $objctF;
?>