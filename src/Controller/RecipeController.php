<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

class RecipeController extends AbstractController
{
    #[Route(path: '/recette', name: 'app_recipe_index')]
    public function index(Request $request): Response
    {
        return $this->render('recipe/index.html.twig'); 
    }


    #[Route(path: '/recette/{slug}-{id}', name: 'app_recipe_show', requirements : ['id'=> '\d+', 'slug'=> '[a-z0-9-]+'])]
    public function show(Request $request, string $slug, int $id): Response
    {
    //    dd($request->attributes->get('slug'),$request->attributes->getInt('id') );
        // dd($slug, $id);
        //affiche normal
        // return new Response("Recette numéro " .$id . " : " . $slug);

        //affiche en Json version longue en important JsonResponse
        // return new JsonResponse([
        //     'id' => $id,
        //     'slug' => $slug
        // ]);

        //Affiche en Json sans besoin d'import
        // return $this->Json([
        //         'id' => $id,
        //         'slug' => $slug
        //     ]);
        // return new Response("Bienvenue dans la page " .$request->query->get('recette', 'des Recettes'));
        return $this->render('recipe/show.html.twig', [
            'slug' => $slug,
            'id' => $id
        ]); 
    }

   
}
