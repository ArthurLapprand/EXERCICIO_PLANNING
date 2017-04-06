;; logistics domain
;;
;; logistics-typed-length: strips + simple types
;;    based on logistics-strips-length.
;; Tue Dec  1 16:10:25 EST 1998 Henry Kautz

(define (domain logistics-typed)
  (:requirements :strips :typing) 
  (:types BLOCK GRIPPER)
  (:predicates 	
		(holding ?obj)
		(ontable ?obj)
		(clear ?obj)
		(empty ?gripper)
		(on ?obj1 ?obj2))
  (:action PICKUP
	:parameters
		 (?obj1 - BLOCK
		  ?obj2 - BLOCK
		  ?gripper - GRIPPER)
	:precondition
		(and 	(empty ?gripper) 
			(clear ?obj1)
			(on ?obj1 ?obj2))
	:effect
		(and 	(holding ?obj1)
			(clear ?obj2)
			(not (empty ?gripper)) 
			(not(on ?obj1 ?obj2))
			(not(clear ?obj1))))

  (:action PICKUPTABLE
	:parameters
		(?obj - BLOCK
		 ?gripper - GRIPPER)
	:precondition
		(and    (empty ?gripper) 
			(clear ?obj)
			(ontable ?obj))
	:effect
   		(and 	(holding ?obj)
			(not (empty ?gripper)) 
			(not(clear ?obj))
			(not(ontable ?obj))))

  (:action PUTDOWN
	:parameters
		(?obj1 - BLOCK
		 ?obj2 - BLOCK
		 ?gripper - GRIPPER)
	:precondition
		(and    (holding ?obj1) 
			(clear ?obj2))
	:effect
		(and	(empty ?gripper)
			(on ?obj1 ?obj2)
			(clear ?obj1)
			(not (clear ?obj2)) 
			(not(holding ?obj1))))

  (:action PUTDOWNTABLE
	:parameters
		(?obj - BLOCK
		 ?gripper - GRIPPER)
	:precondition
		(and	(holding ?obj))
	:effect
		(and	(empty ?gripper)
			(ontable ?obj)
			(clear ?obj)
			(not (holding ?obj))))

)
