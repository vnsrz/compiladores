lookahead = "+"
ex = "123+"
token = ""

def next_token():
    

def reconhecer(token):
    print(2)
    # if token==lookahead:
    #     lookahead = next_token();
    # else:
    #     erro();

def expr():
    digito()
    resto()

def digito():
    if lookahead.isdigit():
        print(lookahead)
        reconhecer(lookahead)
    else:
        erro()

def resto():
    if lookahead=="+":
        reconhecer("+")
        digito()
        print("+")
        resto()
    elif lookahead=="-":
        reconhecer("-")
        digito()
        print("-")
        resto()
    elif lookahead != "":
        erro()

def erro():
    print("Erro de sintaxe")
    SystemExit(-1)

