const novoDoc = document.querySelector("#novo-documento")

//funções


//Eventos
console.log(novoDoc);
novoDoc.addEventListener("click", () => {
    document.frm.action = "../login.asp"
    document.frm.submit()
})