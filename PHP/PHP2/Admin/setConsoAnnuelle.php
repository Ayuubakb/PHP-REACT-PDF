<?php

    require('../utils/cors.php');
    require('../utils/connexion.php');

    $conn=setConnection();

    $file=$_FILES['fichier'];
    $txt=fopen($file['tmp_name'],'r') or die("Ouverture Non Possible");
    $format=true;
    $i=1;
    while(!feof($txt)){
        $tab=array();
        $tab2=array();
        $colomn=array();
        $line=fgets($txt);
        $tab=explode('/', $line);
        if(count($tab)!= 4 || !strcmp(trim($tab[0]),'') || !strcmp(trim($tab[1]),'') || !strcmp(trim($tab[2]),'') || !strcmp(trim($tab[3]),'') )
            $format=false;
        foreach( $tab as $t ){
            $tab2=explode(':',$t);
            if(count($tab2)!= 2 || !strcmp(trim($tab2[0]),'') || !strcmp(trim($tab2[1]),''))
                $format=false;
            else{
                $colomn[trim($tab2[0])]=trim($tab2[1]);
            }
        }
        if(!isset($colomn['id']) || !isset($colomn['annee']) || !isset($colomn['consommation']) || !isset($colomn['date']))
            $format=false;
        if($format){
            $id=$colomn['id'];
            $annee=$colomn['annee'];
            $consommation=$colomn['consommation'];
            $date=$colomn['date'];
            $query="SELECT * from consommation_annuelle WHERE id_client=$id and Annee=$annee ";
            $checkExist=mysqli_query($conn,$query);
            if(mysqli_num_rows($checkExist) == 0 ){
                $status=1;
                $query="SELECT sum(f.consommation) as consoClient from facture f INNER JOIN
                        consommation_mensuelle c ON f.id_consommation=c.id
                        WHERE c.id_client=$id and c.annee=$annee";
                $consoClient=mysqli_query($conn,$query);
                $row=mysqli_fetch_assoc($consoClient);
                $consoClient=$row['consoClient'];
                if(!(intVal($consommation)+50 >= intVal($consoClient)) || !(intVal($consommation)-50 <= intVal($consoClient)))
                    $status=0;
                $query="INSERT INTO consommation_annuelle(id_client,Annee,consommation,dateDeSaisie,STATUS) VALUES($id,$annee,$consommation,'$date',$status)";
                $insertConso=mysqli_query($conn,$query);
                if($insertConso){
                    echo "****Consommation de ".$annee." du client ".$id." Bien Ajoute****";
                }
            }else{
                echo "!!!!!Consommation de ".$annee." du client ".$id." est deja saisie!!!!";
            }
        }else{
            echo "!!!!!Donnees Incorrecte Au Niveu du Ligne : ".$i."!!!!!";
        }
        $i++;
    }

?>