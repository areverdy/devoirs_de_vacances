Table eleves {
  id integer [primary key, increment]
  nom varchar
  prenom varchar
}
  
 Table notes {
 id integer [primary key, increment]
 note integer
 eleves_id integer

}
 
Ref: notes.eleves_id > eleves.id