(define (problem macacos_me_mordam)
    (:domain logistics-typed)
    (:objects
        macaco - MACACO

        banana - BANANA

        caixa - CAIXA

        a - LOCALIZACAO
        b - LOCALIZACAO
        c - LOCALIZACAO
    )
    (:init
        (not_holding macaco banana)
        (not_holding macaco caixa)

        (at macaco a)
        (at caixa b)
        (at banana c)

        (at_altura macaco baixa)
        (at_altura caixa baixa)
        (at_altura banana alta)
    )
    (:goal (and
        (at macaco a)
        (at banana a)
        (at_altura macaco baixa)
        (at_altura banana baixa)
    ))
)
