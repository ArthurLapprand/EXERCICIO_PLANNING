(define (domain logistics-typed)
  (:requirements :strips :typing) 
  (:types MACACO BANANA CAIXA ALTURA LOCALIZACAO)
  (:predicates
		(at ?obj ?loc)
		(on ?obj1 ?obj2)
		(not_holding ?obj1 ?obj2)
		(at_altura ?obj ?altura)
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
			not(not_holding ?macaco ?banana))
			(at_altura ?macaco ?altura)
			(at_altura ?banana ?altura)
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
		(and    (at ?truck ?loc) 
			(in ?obj ?truck))
	:effect
		(and	(not (in ?obj ?truck)) 
			(at ?obj ?loc)))

  (:action UNLOAD-AIRPLANE
	:parameters
		(?obj - PACKAGE
		 ?airplane - AIRPLANE
		 ?loc - AIRPORT)
	:precondition
		(and	(in ?obj ?airplane) 
			(at ?airplane ?loc))
	:effect
		(and 
			(not (in ?obj ?airplane)) 
			(at ?obj ?loc)))

  (:action DRIVE-TRUCK
	:parameters
		(?truck - TRUCK
		 ?loc-from - LOCATION
		 ?loc-to - LOCATION
		 ?city - CITY)
	:precondition
		(and 	(at ?truck ?loc-from)
			(in-city ?loc-from ?city)
			(in-city ?loc-to ?city))
	:effect
		(and 	(not (at ?truck ?loc-from)) 
			(at ?truck ?loc-to)))

  (:action FLY-AIRPLANE
	:parameters
		(?airplane - AIRPLANE
		 ?loc-from - AIRPORT
		 ?loc-to - AIRPORT)
	:precondition
		(at ?airplane ?loc-from)
	:effect
		(and 	(not (at ?airplane ?loc-from)) 
		(at ?airplane ?loc-to)))
)

