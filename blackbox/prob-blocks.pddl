;; original name logistics.a
;; extended version of logistics_facts7h
;; (:length (:parallel 11))
;; optimal
;; #actions 54 #states 10^11
;;
;; note: by going to a non-typed representation
;;       of the problems, the instances become (somewhat)
;;       harder to solve.
;;       (larger propositional representation)
;;

(define (problem log005)
    (:domain logistics-typed)
    (:objects
        object1 - BLOCK
        object2 - BLOCK
	
	gripper - GRIPPER

    )
    (:init
	(clear object1)
        (ontable object2)
        (on object1 object2)
	(empty gripper)
    )
    (:goal (and
	(ontable object1)
        (on object2 object1)
	(empty gripper)
    ))
)
