

Ce didacticiel explique comment créer et gérer des projets sur Google Cloud avec Terraform. Avec Terraform, bon nombre de vos ressources telles que les projets, les stratégies IAM, les réseaux, les instances Compute Engine et les clusters Kubernetes Engine peuvent être gérées, versionnées et facilement recréées pour votre organisation ou vos équipes. L'état généré par Terraform est enregistré dans Cloud Storage à des fins de persistance.

Remarque : Ce didacticiel est axé sur la création de projets. Pour une présentation générale de Terraform sur Google Cloud, consultez la documentation du fournisseur.

Objectifs
Créez un projet d'administration Terraform pour le compte de service et le compartiment d'état distant.
Accordez des autorisations au niveau de l'organisation au compte de service.
Configurez l'état distant dans Cloud Storage.
Utilisez Terraform pour provisionner un nouveau projet et une instance dans ce projet.
Schéma d'architecture des composants du didacticiel :

Avant que tu commences
Ce didacticiel suppose que vous disposez déjà d'un compte Google Cloud configuré pour votre organisation et que vous êtes autorisé à apporter des modifications au niveau de l'organisation dans le compte. Consultez la documentation pour plus de détails sur la création et la gestion des organisations.

Les commandes de ce didacticiel en dehors de Terrafrom sont exécutées avec l'outil de ligne de commande gcloud du SDK Google Cloud. Ce didacticiel part du principe que l'outil gcloud est installé et autorisé à utiliser votre compte conformément à la documentation.

Ce tutoriel nécessite terraform v0.12.0+ et google_provider 3.0.0+. Une version précédente de ce tutoriel utilisant google_provider 2.x.x est ici. Le didacticiel actuel a été testé avec les éléments suivants :
