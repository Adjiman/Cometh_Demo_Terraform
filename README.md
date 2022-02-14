# ROADMAP ACCOMPAGNEMENT INGENERIE DEVOPS #

Cette roadmap contient la stratégie DevOps à mettre en place en 2 mois. L'objectif de la mission serait de mettre en place un ecosystème qui permet au developpeurs de se concentrer sur le code à produire, d'itérer sa mise en production à chaque commit, et lancer le jeu dans sa phase post-production.   
Tout cela va s'inscrire dans la stratégie globale déjà mis en place avant ma prise de fonction.

## 1- Mise en place d'une organisation dans un écosystème GPC/Etheureum/Unity

L'organisation consiste à mettre en place trois grandes familles de folders (dossiers) repartis en 3 couches verticales qui representent les trois niveaux de déploiement de l'environnement de developpement à l'environnement de production: SaaS, Paas et IaaS. La réalisation de l'ensemble de l'écosystème par l'équipe DevOps se fera dans le sens inverse: IaaS, PaaS et SaaS. 

### 1-a- L'architecture IaaS (Infrastructure As A Service)

Il s'agit ici du déploiement de l'architecture des ressources informatiques à deployer dans l'écosystème cloud GCP par l'intermediaire des API que GCP met à notre disposition pour communiquer avec leur infrastructure physique.
 
Outils et services associés: Nous avons 4 outils à installer, une fois un compte GCP crée et configuré manauellement pour notre organisation, pour interagir avec les ressources:

1. Cloud Platform Console: Il s'agit de l'interface graphique qui est l'outil de visualisation pour directement voir l'état des ressources par exemple si une machine est on ou down.

2. Cloud SDK qui est l'outil de ligne de commande gcoud pour configurer le perimètre d'organisation lié à un compte de facturation, créer le projet d'administration Terraform, créer le compte service Terraform et ajouter les autorisations au niveau de l'organisation, des dossiers, des sous-dossiers et des projets afin de definr le perimètres de sécurité suivant une hiérachie. Cela permet se savoir les droits de lecture, d'écriture, de mise à jour ou de suppressions autorisés à des utilisateurs selon les directives du CTO et/ou VP engineering.

3. Cloud Console Mobile App, qui est une application mobile disponible sur Android et IOS. C'est un moyen qui nous permet d'acceder rapidemant à certaines informations pertinentes par exemple la facturation, l'état des ressources, la reception des alertes, .... Par exemple pour un collaborateur qui est en astreinte, et qui dispose de quelques droits, peut avoir un apercu rapide par rapport à ce ce qui se passe.  
4. Terraform, qui est est outil open-source qui servira à communiquer avec les RESTful API des ressources pour créer à distance les dits ressources dont nous aurons besoin pour deployer notre notre code front-end et back-end qui communiquera avec l'ecosytème euthereum. Donc avec Terraform, nous allons accéder aux produits et ressources du cloud GCP par programmation. Avec les commandes terraform init, plan, play & destroy, nous pourrions inspecter, créer ou detruire notre infrastructure en queques minutes. La documentation est très bien fournir pour chque ressource à créee.  

NB: Il faut preciser que ans la GCP, nous avons une organisation de ressources par projets. Donc l'ensemble des ressources (instances, espace de de stockage, des clusters Kubernetes, des reseaux VPC, ) que nous allons deployer appartient forcement à un et un seul projet. Cette architecture est obligatoire sur le GCP. Donc les projets sont des espaces d'isolation d'enveloppes de ressoureces et des perimètres de sécurité qu'on peut établir. Ã la fin, ces projets permettent d'affecter leurs ressources à un compte de facturation. Donc un compte de facturation peut gérer un ou plusieurs projets. Ressources ==> Projets ==> Folders (Sous-Dossiers Dev, QA, Prod) ==> Folders (Dossiers en fonction de la hierachie de l'organisation: par pays, par departement, par filiale, par env. ) ==> Org. À chaque niveau de l'organisation, nous pouvons définir une stratégie de sécurité) et le noeud organisation associé au nom de domaine de l'entreprise ou l'entreprise.


### 1-b- L'architecture PaaS (Platform As A Service)

A ce niveau, nous allons mettre en place, la tuyauterie de plomberie de notre pipeline de deploiement CI/CD entre l'environnement de Dev et de Prod.

Outils et services:  

1. Terraform/Ansible: Nous allons d'abord construire une première tuyauterie entre la VM (machine virtuelle) construire à mis chemin par terraform et l'environnement de developpement
.
2. Jenkins/Gitlab/Ansible: L'infrastructure créee ainsi que la zone DNS, une deuxième tuyauterie est construite pour ordonnancer la validation des pull requests à chaque commit par chaque développeurs, l'automatisation des tests et l'automatisation de la mise en production. Un pipeline étant ainsi crée, les intégrations et les déploiements peuvent se derouler de facon continue.

### 1-c- L'architecture SaaS (Software As A Service)

À ce niveau, nous allons mettre en place l'environnement de Developpement qui prend en compte en amont, l'environnement de conception (game designers, ateliers artistiques, conception de l'architecture technique), et en aval, l'environnement post-production de lancement du jeu.

Outils & services: 

Stack technique:
Back: Node.js, Typescript
Front: React
Blockchain : Solidity
Web3 : ethers.js, web3.js
Jeux : Pixi.js, Unity










