# pip install aima3
from aima3.logic import expr,FolKB, fol_fc_ask

clauses = []



clauses.append(expr("Progenitor(Maria,Joao)"))
clauses.append(expr("Progenitor(Jose,Joao)"))
clauses.append(expr("Progenitor(Maria,Ana)"))
clauses.append(expr("Progenitor(Jose,Ana)"))

clauses.append(expr("Progenitor(x,y) ==> Pessoa(x)"))
clauses.append(expr("Progenitor(x,y) ==> Pessoa(y)"))


clauses.append(expr("Sexo(Maria,Feminino)"))
clauses.append(expr("Sexo(Joao,Masculino)"))
clauses.append(expr("Sexo(Jose,Masculino)"))
clauses.append(expr("Sexo(Ana,Feminino)"))

clauses.append(expr("Progenitor(x,y) ==> Descendente(y,x)"))

clauses.append(expr("Progenitor(x,y) & Sexo(x,Masculino) ==> Pai(x,y) "))
clauses.append(expr("Progenitor(x,y) & Sexo(x,Feminino) ==> Mae(x,y) "))

clauses.append(expr("Progenitor(x,y) & Progenitor(x,z) & Sexo(y,Masculino) ==> Irmao(y,z)"))
clauses.append(expr("Progenitor(x,y) & Progenitor(x,z) & Sexo(y,Feminino) ==> Irma(y,z)"))



Genealogia = FolKB(clauses)

perguntas = ["Sexo(x,Masculino)",
             "Sexo(Maria,x)",
             "Irmao(x,Ana)",
             "Irma(x,Joao)",
             "Descendente(x,Maria)",
             "Descendente(Joao,x)",
             "Pessoa(x)",
             "Mae(x,y)",
             "Pai(x,y)"]



for i in perguntas:
    resposta = fol_fc_ask(Genealogia, expr(i))
    print("%s -> %s" %(i, (list(resposta))))

