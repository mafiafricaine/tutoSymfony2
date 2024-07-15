<?php

namespace App\Controller;

use App\Entity\Recipe;
// use App\Entity\User;
use App\Form\RecipeType;
use DateTimeImmutable;
use App\Repository\RecipeRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Contracts\Translation\TranslatorInterface;

class RecipeController extends AbstractController
{
    #[Route(path: '/recette', name: 'app_recipe_index')]
    public function index(Request $request, EntityManagerInterface $em, TranslatorInterface $translator): Response
    {
        if($this->getUser()){
            if (!$this->getUser()->isVerified()){
                $this->addFlash('info', $translator->trans('recipeController.emailNotVerified'));
            }
        }
        //permet de recuperer toutes les recettes en BD
        // $recipes = $repository->findAll();

        $recipes = $em->getRepository(Recipe::class)->findAll();
        //permet de recuperer toutes les recettes en dessous d'une durée en BD
        // $recipes = $repository->findRecipeDurationLowerThan(60);
        // dd($recipes);

        //version classique 
        // $recipe = new Recipe();
        // $recipe->setTitle('Sushi Saumon');
        // $recipe->setSlug('sushi-saumon');
        // $recipe->setContent('Prenez du riz et du saumon.');
        // $recipe->setDuration(156);
        // $recipe->setCreatedAt(new DateTimeImmutable());
        // $recipe->setUpdatedAt(new DateTimeImmutable());
        // $em->persist($recipe); 


        //version avec l'utilisation de fluent setter
        // $recipe2 = new Recipe();
        // $userRepo = $em->getRepository(User::class);
        // $user = $userRepo->find(1);
        // dd($user);
        // $recipe2->setTitle('Sushi Au Saumon')
        //     ->setSlug('sushi-au-saumon')
        //     ->setContent('Tu prends du riz et du saumon.')
        //     ->setDuration(45)
        //     ->setImageName('https://th.bing.com/th/id/OIP.YzNBu-r2yymhRgwhGIZ_rgHaJ4?rs=1&pid=ImgDetMain')
        //     ->setCreatedAt(new DateTimeImmutable())
        //     ->setUpdatedAt(new DateTimeImmutable())
        //     ->setUser($user);

        // $em->persist($recipe2); 


        // $recipes[5]->setTitle('Pizza Bolognaise')
        //     ->setSlug('pizza-bolognaise')
        //     ->setContent('Suffis de prendre une pate a pizza et de rajouter de la bolognaise');

        // $em->remove($recipes[5]);
        // $em->flush();
        return $this->render('recipe/index.html.twig', [
            'recipes' => $recipes
        ]); 
    }

    #[Route(path: '/recette/{slug}-{id}', name: 'app_recipe_show', requirements : ['id'=> '\d+', 'slug'=> '[a-z0-9-]+'])]
    public function show(Request $request, string $slug, int $id,RecipeRepository $repository): Response
    {
         //ca nous permet de recuperer une recette à partir du slug donné en paramètre
        // $recipe1 = $repository->findOneBy(['slug' => $slug]);
        // dd($recipe1);
        //ca nous recupere une recette correspondant à l'id
        $recipe = $repository->find($id);
        if($recipe->getSlug() !== $slug){
            return $this->redirectToRoute('app_recipe_show', ['id' => $recipe->getId(), 'slug' => $recipe->getSlug()]);
        }
        // dd($recipe);
         return $this->render('recipe/show.html.twig', [
            'recipe' => $recipe
        ]); 
    }

    #[Route(path : '/recette/create', name : 'app_recipe_create')]
    public function create(Request $request, EntityManagerInterface $em) : Response {
        if ($this->getUser()){
            if(!$this->getUser()->isVerified()){
                $this->addFlash('error', 'You must confirm your email to create Recipe !');
                return $this->redirectToRoute('app_recipe_index');
            }
        }else{
            $this->addFlash('error', 'You must login to create Recipe !');
            return $this->redirectToRoute('app_login');
        }
        $recipe = new Recipe;
        $form = $this->createForm(RecipeType::class, $recipe);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()){
            $recipe->setUser($this->getUser());
            $recipe->setCreatedAt(new DateTimeImmutable());
            $recipe->setUpdatedAt(new DateTimeImmutable());
            $em->persist($recipe);
            $em->flush();
            $this->addFlash('success', 'La recette '. $recipe->getTitle() .' a bien été créée');
            return $this->redirectToRoute('app_recipe_index');
        }
        return $this->render('recipe/create.html.twig', [
            'monForm' => $form
        ]);
    }

    #[Route(path: '/recette/{id}/edit', name: 'app_recipe_edit')]
    public function edit(Recipe $recipe, Request $request, EntityManagerInterface $em): Response
    {
        if ($this->getUser()){
            if(!$this->getUser()->isVerified()){
                $this->addFlash('error', 'You must confirm your email to edit Recipe !');
                return $this->redirectToRoute('app_recipe_index');
            }else if ($recipe->getUser()->getEmail() !== $this->getUser()->getEmail()){
                $this->addFlash('error', 'You must to be the user '. $recipe->getUser()->getEmail() . ' to edit this recipe !');
                return $this->redirectToRoute('app_recipe_index');
            }
        }else{
            $this->addFlash('error', 'You must login to edit Recipe !');
            return $this->redirectToRoute('app_login');
        }  
        
        // dd($recipe);
        //cette methode prend en premier paramètre le formulaire que l'on souhaite utiliser
        //en second paramètre elle prend les données 
        $form = $this->createForm(RecipeType::class, $recipe); 
        $form->handleRequest($request);  
        // dd($recipe); 
        if($form->isSubmitted() && $form->isValid()){
            $recipe->setUpdatedAt(new DateTimeImmutable());
            $em->flush();
            $this->addFlash('success','La recette a bien été modifiée');
            return $this->redirectToRoute('app_recipe_show', ['id' => $recipe->getId(), 'slug' => $recipe->getSlug()]);
        }
        return $this->render('recipe/edit.html.twig', [
            'recipe' => $recipe,
            'monForm' => $form
        ]);
    }

    

    #[Route(path: '/recette/{id}/delete', name: 'app_recipe_delete', requirements : ['id'=> '\d+'])]
    public function delete(Recipe $recipe, EntityManagerInterface $em): Response{
        if ($this->getUser()){
            if(!$this->getUser()->isVerified()){
                $this->addFlash('error', 'You must confirm your email to delete Recipe !');
                return $this->redirectToRoute('app_recipe_index');
            }else if ($recipe->getUser()->getEmail() !== $this->getUser()->getEmail()){
                $this->addFlash('error', 'You must to be the user '. $recipe->getUser()->getEmail() . ' to delete this recipe !');
                return $this->redirectToRoute('app_recipe_index');
            }
        }else{
            $this->addFlash('error', 'You must login to delete Recipe !');
            return $this->redirectToRoute('app_login');
        }  
        $titre = $recipe->getTitle();
        $em->remove($recipe);
        $em->flush();
        $this->addFlash('info', 'La recette '. $titre . ' a bien été supprimée');
        return $this->redirectToRoute('app_recipe_index');
    }
  
}
