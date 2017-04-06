(define (domain logistics-typed)
  (:requirements :strips :typing) 
  (:types MACACO BANANA CAIXA ALTURA LOCALIZACAO)
  (:predicates 	
		(at ?obj ?loc)
		(on ?obj1 ?obj2)
		(in-city ?loc-or-truck ?city))
  (:action LOAD-TRUCK
	:parameters
		 (?obj - PACKAGE
		  ?truck - TRUCK
		  ?loc - LOCATION)
	:precondition
		(and 	(at ?truck ?loc) 
			(at ?obj ?loc))
	:effect
		(and 	(not (at ?obj ?loc)) 
			(in ?obj ?truck)))

  (:action LOAD-AIRPLANE
	:parameters
		(?obj - PACKAGE
		 ?airplane - AIRPLANE
		 ?loc - AIRPORT)
	:precondition
		(and
			(at ?obj ?loc) 
			(at ?airplane ?loc))
	:effect
   		(and 	(not (at ?obj ?loc)) 
			(in ?obj ?airplane)))

  (:action UNLOAD-TRUCK
	:parameters
		(?obj - PACKAGE
		 ?truck - TRUCK
		 ?loc - LOCATION)
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

