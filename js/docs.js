const txtHeight = document.querySelector("#txt-height input")

redInicio = () => {
    document.frm.action = "/Pages/dashboard.asp" 
    document.frm.submit()
}

function tamFonte(tamanho) {
    console.log(tamanho);
    doc.document.execCommand("fontSize", false, tamanho);
}
function aumentarFonte(){
    let num = parseFloat(txtHeight.value) + .5
    txtHeight.value = num
    tamFonte(num)
}
function diminuirFonte(){
    let num = parseFloat(txtHeight.value) - .5
    txtHeight.value = num
    tamFonte(num)
}