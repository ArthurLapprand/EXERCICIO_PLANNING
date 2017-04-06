(define (domain logistics-typed)
  (:requirements :strips :typing) 
  (:types MACACO BANANA CAIXA ALTURA LOCALIZACAO)
  (:predicates
		(at ?obj ?loc)
		(on ?obj1 ?obj2)
		(not_holding ?obj1 ?obj2)
		(at_altura ?obj ?altura))
  
  (:action EMPURRAR_CAIXA
	:parameters
		 (?caixa - CAIXA
		  ?banana - BANANA
		  ?macaco - MACACO
		  ?loc - LOCALIZACAO
		  ?loc2 - LOCALIZACAO
		  ?altura - ALTURA)
	:precondition
		(and
			(not_holding ?macaco ?banana)
			(at ?macaco ?loc)
			(at ?caixa ?loc)
			(at_altura ?macaco ?altura)
			(at_altura ?caixa ?altura))
	:effect
		(and
			(at ?caixa ?loc2)
			(at ?macaco ?loc2)
			(at_altura ?macaco ?altura)
			(at_altura ?caixa ?altura)
			(not(at ?caixa ?loc)) 
			(not(at ?macaco ?loc))))

  (:action ANDAR_COM_BANANA
	:parameters
		(?caixa - CAIXA
		 ?banana - BANANA
		 ?macaco - MACACO
		 ?loc - LOCALIZACAO
		 ?loc2 - LOCALIZACAO
		 ?altura - ALTURA)
	:precondition
		(and
			(at ?macaco ?loc) 
			(at ?banana ?loc)
			(not(not_holding ?macaco ?banana))
			(at_altura ?macaco ?altura)
			(at_altura ?banana ?altura))
	:effect
   		(and
   			(not (at ?macaco ?loc))
   			(not (at ?banana ?loc))
   			(at_altura ?macaco ?altura)
			(at_altura ?banana ?altura)
			(at ?macaco ?loc2)
			(at ?banana ?loc2)))

  (:action PEGAR_BANANA
	:parameters
		(?caixa - CAIXA
		 ?banana - BANANA
		 ?macaco - MACACO
		 ?loc - LOCALIZACAO
		 ?altura - ALTURA)
	:precondition
		(and
			(at ?macaco ?loc)
			(at ?banana ?loc)
			(on ?macaco ?caixa)
			(not_holding ?macaco ?banana)
			(at_altura ?macaco ?altura)
			(at_altura ?banana ?altura))
	:effect
		(and
			(at ?macaco ?loc)
			(at ?banana ?loc)
			(not(not_holding ?macaco ?banana))
			(at_altura ?macaco ?altura)
			(at_altura ?banana ?altura)))

  (:action SUBIR_CAIXA
	:parameters
		(?caixa - CAIXA
		 ?macaco - MACACO
		 ?loc - LOCALIZACAO
		 ?altura - ALTURA
		 ?altura2 - ALTURA)
	:precondition
		(and
			(at ?macaco ?loc)
			(at ?caixa ?loc)
			(at_altura ?macaco ?altura))
	:effect
		(and
			(at ?macaco ?loc)
			(at ?caixa ?loc)
			(at_altura ?macaco ?altura2)))

(:action DESCER_CAIXA
	:parameters
		(?caixa - CAIXA
		 ?macaco - MACACO
		 ?loc - LOCALIZACAO
		 ?altura - ALTURA
		 ?altura2 - ALTURA)
	:precondition
		(and
			(at ?macaco ?loc)
			(at ?caixa ?loc)
			(at_altura ?macaco ?altura2))
	:effect
		(and
			(at ?macaco ?loc)
			(at ?caixa ?loc)
			(at_altura ?macaco ?altura)))
)