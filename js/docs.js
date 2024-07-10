const txtHeight = document.querySelector("#txt-height input")
const fontes = ['Helvetica','Arial','Verdana','Tahoma','Trebuchet MS','Impact','Gill Sans','Times New Roman','Palatino','Baskerville','Andalé Mono','Courier']
const tagFont = document.querySelector("#font-family")
const btnsEdit = [...document.querySelectorAll(".box button")]
const frameDoc = document.getElementById("doc")
let fontSize = 11
const doc = document.querySelector("#doc")
const btnsFont = [...document.querySelectorAll(".font")]
const btnSave = document.querySelector("#btnSave")

let formatacao = true

let textoBruto = frameDoc.innerHTML

let textoSelecionado = {
  start:"",
  end:""
} 

let editores =[
  {
    edit:"bold",
    regex: /\*b\*(.*?)\*b\*/g,
    style: "font-weight:bold"
  },
  {
    edit:"italic",
    regex: /\*i\*(.*?)\*i\*/g,
    style: "font-style:italic"
  },
  {
    edit:"underline",
    regex: /\*u\*(.*?)\*\u*/g,
    style: "text-decoration:underline"
  }
  
]

// let html

// let containerFonts

// let blocoFlutuante
btnsEdit.map((btn) => {
    btn.addEventListener("click", () => {
      btn.classList.toggle("selecionado")
      // if(btn.id == "txt-color"){
      //   blocoFlutuante = document.createElement("div")
      //   blocoFlutuante.setAttribute("id", "paletaCores")
      //   CriarBoxFlutuante(btn,blocoFlutuante,"right")
      //   blocoFlutuante.innerHTML = szCriarCoresPaleta()
      //   let cores;
      //   cores = [...blocoFlutuante.querySelectorAll("div")]
      //   cores.map((cor) => {
      //     cor.addEventListener("click", () => {
      //       doc.contentWindow.document.execCommand("foreColor", false, cor.id)
      //     })
      //   })
      // }else if(btn.id == "txt-height" && Num(fontSize.innerHTML) <= 7 ){
      //   fontSize = fontSize + 1
      //   doc.contentWindow.document.execCommand("fontSize", false, fontSize)
      // }else{
        
        editando(btn.id)
      // }
      // limparSelecao()
    })

  })
  tagFont.addEventListener("click", () => {
    containerFonts = document.createElement("div")
    containerFonts.setAttribute("id","listFont")
    CriarBoxFlutuante(tagFont,containerFonts)
    fontes.map((font) => {
        containerFonts.innerHTML +="<div>" + font + "</div>"
    })
  })
  
document.addEventListener("selectionchange",() => {
  const selection = document.getSelection();
  const selectedText = selection.toString();

  
  textoSelecionado.start = document.selectionStart
  textoSelecionado.end = document.selectionEnd

})
//   btnsFont.map((el) => {
//     el.addEventListener("click", ()=> {
//         el.classList.toggle("selecionado")
//     })
//   })

//   function limparSelecao() {
//       if (doc.document.getSelection) {
//           doc.document.getSelection().removeAllRanges();
//       } else if (doc.document.selection) {
//           doc.document.selection.empty();
//       }
//   }

//   function applyHighlight() {
//       // Obtém a seleção atual
//       var selection = window.getSelection();

//       // Verifica se há texto selecionado
//       if (!selection.isCollapsed) {
//           // Cria um elemento span para envolver o texto destacado
//           var span = document.createElement('span');
//           span.style.backgroundColor = 'yellow'; // Altera a cor de fundo para amarelo (pode ser ajustada)

//           // Envolve o texto selecionado com o elemento span
//           var range = selection.getRangeAt(0);
//           range.surroundContents(span);
//       }
//   }
function semFormatacao(event) {
  
}
  window.onload = function() {
    // var iframe = document.getElementById('doc');
    // // Verifica se o iframe está acessível
    // if (iframe.contentWindow && iframe.contentWindow.document) {
    //   var iframeDoc = iframe.contentWindow.document;
    // iframe.designMode = "On"

    
    
        if(!btnsEdit.some(btn => btn.classList.contains("selecionado"))){
          frameDoc.innerHTML = frameDoc.innerHTML + "<span id='padr'></span>"
        }
    
      

    //     // Acessa o body dentro do iframe e modifica o estilo
    //     var body = iframeDoc.querySelector('body');
    //     html = body
    //     if (body) {
    //         body.style = 'word-wrap: break-word;padding: 0 10%;';
    //         body.addEventListener("click", () => {
    //             let box = document.querySelector(".boxFloat")
    //             if(box)box.remove()
    //         })
    //     }

    // } else {
    //     console.log("Não foi possível acessar o conteúdo do iframe.");
    // }


};


// redInicio = () => {
//     document.frm.action = "/Pages/dashboard.asp" 
//     document.frm.submit()
// }
function iniciar(){
  editores.map((ed) => {
    EditarTexto(ed.regex,ed.style)
  })
}
function adicionarEditor(edit){
  let txt 
  let regex
  let style
  switch (edit) {
    case "bold":
      
      regex = /\*b\*(.*?)\*\*/g
      style = "font-weight:bold"
      break;
    case "italic":
      regex = /\*i\*(.*?)\*\*/g
      style = "text-decoration:italic"
      break;
    case "underline":
      regex = /\*u\*(.*?)\*\*/g
      style = "text-decoration:underline"
      break;
  
    default:
      txt = edit
      break;
  }
  frameDoc.innerHTML += `<div style="${style}">`
}

function editando(){
  switch (edit) {
    case "bold":
      regex = /\*b\*(.*?)\*\*/g
      style = "font-weight:bold"
      EditarTexto(regex,style)
      break;
    case "italic":
      regex = /\*i\*(.*?)\*\*/g
      style = "text-decoration:italic"
      EditarTexto(regex,style)
      break;
    case "underline":
      regex = /\*u\*(.*?)\*\*/g
      style = "text-decoration:underline"
      EditarTexto(regex,style)
      break;
  
    default:
      txt = edit
      break;
  }
}

function EditarTexto(regex,style){
  let text = ""
  let match 
  let indexLast

  while((match = regex.exec(frameDoc.innerHTML)) !== null){
    if(text.length == 0){
      text = frameDoc.innerHTML.substring(text.length,match.index ) +`<div style="${style}">`+ match[1] +`</div>`
    }else{
      text = text + frameDoc.innerHTML.substring(indexLast,match.index) +`<div style="${style}">`+ match[1] +`</div>`
    }
    indexLast = match.index + match[0].length
  }
  text = text + frameDoc.innerHTML.substring(indexLast)

  frameDoc.innerHTML = text

  console.log(frameDoc.innerHTML);
}
function editarSelecao(regex,style){
  let text = ""
  let match 
  let indexLast

  while((match = regex.exec(frameDoc.innerHTML)) !== null){
    if(text.length == 0){
      text = frameDoc.innerHTML.substring(text.length,match.index ) +`<div style="${style}">`+ match[1] +`</div>`
    }else{
      text = text + frameDoc.innerHTML.substring(indexLast,match.index) +`<div style="${style}">`+ match[1] +`</div>`
    }
    indexLast = match.index + match[0].length
  }
  text = text + frameDoc.innerHTML.substring(indexLast)

  frameDoc.innerHTML = text
}

// function tamFonte(tamanho) {
//     doc.contentWindow.document.execCommand("fontSize", false, tamanho);
// }
// function aumentarFonte(){
//     let num = parseFloat(txtHeight.value) + 1
//     if(num > 7 || num < 1)return

//     txtHeight.value = num
//     tamFonte(num)
    
// }
// function diminuirFonte(){
//     let num = parseFloat(txtHeight.value) - 1
//     if(num > 7 || num < 1)return
//     txtHeight.value = num
//     tamFonte(num)
// }

// function CriarBoxFlutuante(btn,boxFloat,pos = "center"){
//     const refRect = btn.getBoundingClientRect(); 
//     boxFloat.style.top = `${refRect.top + window.scrollY + (refRect.height - 3)}px`
//     if(pos == "right"){
//         boxFloat.style.left = `${refRect.right + window.scrollX + 3}px`
//     }
//     boxFloat.setAttribute("class", "boxFloat")
//     btn.parentNode.insertBefore(boxFloat,btn.nextSibling)
//     setTimeout(() => {
//         document.addEventListener("click", (e) => {
//             if(boxFloat){
//                 boxFloat.remove()
//             }
//         })
//     },100)
    
// }

// function szCriarCoresPaleta(){
//     let arrayCores = ['black','red','green','yellow','blue']
//     let paleta = ""
//     arrayCores.map((cor) => {
//         paleta += `<div style="width: 20px; height: 20px; background-color: ${cor};" id="${cor}"></div>`
//     })
//     return paleta
// }

// function save(){
//     fetch('../sql/docSave.asp?html=' + html.innerHTML)
//     .catch((e) => {
//         console.log("error");
//     })

// }

// btnSave.addEventListener("click", () => {
//     if(html.innerHTML != ""){
//         save()
//     }else{
//         alert("escreva algo")
//     }
// })

// iniciar()

// frameDoc.addEventListener("keydown",(e) => {
//   console.log(frameDoc.innerHTML);
//   console.log(formatacao);
// })


















