<?php

namespace App\Form;

use App\Entity\Recipe;
use Symfony\Component\Form\AbstractType;

use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

use Symfony\Component\Form\FormEvents;
use Symfony\Component\String\Slugger\AsciiSlugger;
use Symfony\Component\Form\Event\PreSubmitEvent;
use Symfony\Component\Form\Extension\Core\Type\HiddenType;
use Symfony\Component\Form\Extension\Core\Type\NumberType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Validator\Constraints\Length;

class RecipeType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('title',TextType::class, [
                'label' => 'recipeForm.title'
            ])
            ->add('slug', HiddenType::class)
            ->add('content',TextareaType::class, [
                'label' => 'recipeForm.content'
            ])
            ->add('imageName',TextType::class, [
                'label' => 'recipeForm.imageName'
            ])
            ->add('duration',NumberType::class, [
                'label' => 'recipeForm.duration'
            ])
            ->add('save', SubmitType::class, [
                'label' => 'recipeForm.save'
            ])
            ->addEventListener(FormEvents::PRE_SUBMIT, $this->autoSlug(...))
        ;
    }

    public function autoSlug(PreSubmitEvent $event): void {
        $data = $event->getData();
        $slugger = new AsciiSlugger();
        $slugTitle = strtolower($slugger->slug($data['title']));
        if (empty($data['slug']) || $data['slug'] != $slugTitle){
            $data['slug'] = $slugTitle;
            $event->setData($data);
        }
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Recipe::class,
        ]);
    }
}
