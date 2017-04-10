(define (domain logistics-typed)
  (:requirements :strips :typing) 
  (:types MACACO OBJETO CAIXA ALTURA LOCALIZACAO)
  (:predicates
		(at ?obj ?loc)
		(on ?obj1 ?obj2)
		(not_holding ?obj1 ?obj2)
		(at_altura ?obj ?altura))
  
  (:action EMPURRAR_CAIXA
	:parameters
		 (?caixa - CAIXA
		  ?macaco - MACACO
		  ?loc - LOCALIZACAO
		  ?loc2 - LOCALIZACAO
		  ?altura - ALTURA)
	:precondition
		(and
			(not_holding ?macaco banana)
			(at ?macaco ?loc)
			(at ?caixa ?loc)
			(at_altura ?macaco ?altura)
			(at_altura ?caixa ?altura))
	:effect
		(and
			(not(at ?caixa ?loc)) 
			(not(at ?macaco ?loc))
			(at ?caixa ?loc2)
			(at ?macaco ?loc2)))

(:action ANDAR_SEM_OBJETO
	:parameters
		(
		 ?macaco - MACACO
		 ?loc - LOCALIZACAO
		 ?loc2 - LOCALIZACAO)
	:precondition
		(and
			(at ?macaco ?loc)
			(not_holding ?macaco banana)
			(at_altura ?macaco baixa)
			)
	:effect
   		(and
   			(not (at ?macaco ?loc))
   			(at ?macaco ?loc2)))

  (:action ANDAR_COM_OBJETO
	:parameters
		(?objeto - OBJETO
		 ?macaco - MACACO
		 ?loc - LOCALIZACAO
		 ?loc2 - LOCALIZACAO
		 )
	:precondition
		(and
			(at ?macaco ?loc) 
			(at ?objeto ?loc)
			;; (not(not_holding ?macaco banana))
			(at_altura ?macaco baixa)
			(at_altura ?objeto baixa))
	:effect
   		(and
   			(not (at ?macaco ?loc))
   			(not (at ?objeto ?loc))
   			(at ?macaco ?loc2)
			(at ?objeto ?loc2)))

  (:action PEGAR_OBJETO
	:parameters
		(?caixa - CAIXA
		 ?objeto - OBJETO
		 ?macaco - MACACO
		 ?loc - LOCALIZACAO
		 ?altura - ALTURA)
	:precondition
		(and
			(at ?macaco ?loc)
			(at ?objeto ?loc)
			(on ?macaco ?caixa)
			(not_holding ?macaco ?objeto)
			(at_altura ?macaco ?altura)
			(at_altura ?objeto ?altura))
	:effect
		(and
			(at ?macaco ?loc)
			(at ?objeto ?loc)
			(not(not_holding ?macaco ?objeto))
			(at_altura ?macaco ?altura)
			(at_altura ?objeto ?altura)))

  (:action SUBIR_CAIXA
	:parameters
		(?caixa - CAIXA
		 ?macaco - MACACO
		 ?loc - LOCALIZACAO)
	:precondition
		(and
			(at ?macaco ?loc)
			(at ?caixa ?loc)
			(at_altura ?macaco baixa)
			(at_altura ?caixa baixa))
	:effect
		(and
			(at ?macaco ?loc)
			(at ?caixa ?loc)
			(on ?macaco ?caixa)
			(not (at_altura ?macaco baixa)) 
			(at_altura ?macaco alta)))

(:action DESCER_CAIXA_COM_OBJETO
	:parameters
		(?caixa - CAIXA
		 ?macaco - MACACO
		 ?objeto - OBJETO
		 ?loc - LOCALIZACAO)
	:precondition
		(and
			(on ?macaco ?caixa)
			(not(not_holding ?macaco ?objeto))
			(at ?macaco ?loc)
			(at ?caixa ?loc)
			(at_altura ?macaco alta)
			(at_altura ?objeto alta))
	:effect
		(and
			(at ?macaco ?loc)
			(at ?caixa ?loc)
			(not(on ?macaco ?caixa))
			(not (at_altura ?macaco alta))
			(not (at_altura ?objeto alta))
			(at_altura ?macaco baixa)
			(at_altura ?objeto baixa)))
)