
<%

%>
<html>
  <head>
    <title>Projeto ASP</title>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">

    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="css/docs.css">
    <script src="/js/docs.js" defer></script>
  </head>
  <body name="body">
  <form name="frm">
    <input type="hidden" name="c03id"/>
  </form>
    <div class="box">
      <img src="https://images.vexels.com/media/users/3/142877/isolated/preview/f71decb4816cd27d4460d37b314d2fbf-documento-de-grafico-plano.png" width="50px" height="50px" onclick="redInicio()"/>
    </div>
    <div class="cabecalho">
      <div class="box">

      </div>
      <div class="box">
        <div id="font-family">
          <p>Arial</p>
          <i class="fa-solid fa-arrow-down"></i>
        </div>
        <div id="txt-height">
            <button onCLick="diminuirFonte(this)">-</button>
            <input type="text" value="11" onchange="tamFonte(this.value)"/>
            <button onCLick="aumentarFonte(this)">+</button>
        </div>
      </div>
      <div class="box">
        <button id="underline">
            <i class="fa-solid fa-underline"></i>
        </button>
        <button id="italic">
            <i class="fa-solid fa-italic"></i>
        </button>
        <button id="bold">
            <i class="fa-solid fa-bold"></i>
        </button>
        <button id="hiliteColor">
            <i class="fa-solid fa-highlighter"></i>
        </button>
        <button id="txt-color">
            <i class="fa-solid fa-palette"></i>
        </button>
      </div>
      <div class="box">
        <button id="justifyLeft">
            <i class="fa-solid fa-align-left"></i>
        </button>
        <button id="justifyRight">
            <i class="fa-solid fa-align-right"></i>
        </button>
        <button id="justifyFull">
            <i class="fa-solid fa-align-justify"></i>
        </button>
        <button id="justifyCenter">
            <i class="fa-solid fa-align-center"></i>
        </button>
        <button id="indent">
            <i class="fa-solid fa-indent"></i>
        </button>
        <button id="outdent">
            <i class="fa-solid fa-outdent"></i>
        </button>
      </div>
    </div>
    <div class="metrica"></div>
    <iframe name="doc" id="doc"></iframe>
  </body>
  <script>
    let fontSize = 11
    const btnsEdit = [...document.querySelectorAll(".box button")]
    const frameDoc = document.getElementById("doc")
    let paletaCores
    doc.document.designMode = "On"
    btnsEdit.map((btn) => {
      btn.addEventListener("click", () => {
        if(btn.id == "txt-color"){
          const refRect = btn.getBoundingClientRect(); 
          let cores;
          paletaCores = document.createElement("div")
          paletaCores.setAttribute("id", "paletaCores")
          console.log(refRect.top + " + " + window.scrollY);
          paletaCores.style.top = `${refRect.top + window.scrollY + (refRect.height - 3)}px`
          paletaCores.style.left = `${refRect.right + window.scrollX + 3}px`
          paletaCores.innerHTML = szCriarCoresPaleta()
          btn.parentNode.insertBefore(paletaCores,btn.nextSibling)

          cores = [...paletaCores.querySelectorAll("div")]
          cores.map((cor) => {
            cor.addEventListener("click", () => {
              doc.document.execCommand("foreColor", false, cor.id)
            })
          })
        }else if(btn.id == "txt-height"){
          fontSize = fontSize + 1
          doc.document.execCommand("fontSize", false, fontSize)
        }else{
          doc.document.execCommand(btn.id, false, null)

        }
        // limparSelecao()
      })
    })
    document.addEventListener("click", (e) => {
      if(e.target.id != "paletaCores" && e.target.id != "txt-color"){
        paletaCores.remove()
      }
    })
    doc.document.addEventListener("click", () => {
      paletaCores.remove()
    })
    function szCriarCoresPaleta(){
      let arrayCores = ['black','red','green','yellow','blue']
      let paleta = ""
      arrayCores.map((cor) => {
        paleta += `<div style="width: 20px; height: 20px; background-color: ${cor};" id="${cor}"></div>`
      })
      return paleta
    }

    function limparSelecao() {
        if (doc.document.getSelection) {
            doc.document.getSelection().removeAllRanges();
        } else if (doc.document.selection) {
            doc.document.selection.empty();
        }
    }

    function applyHighlight() {
        // Obtém a seleção atual
        var selection = window.getSelection();

        // Verifica se há texto selecionado
        if (!selection.isCollapsed) {
            // Cria um elemento span para envolver o texto destacado
            var span = document.createElement('span');
            span.style.backgroundColor = 'yellow'; // Altera a cor de fundo para amarelo (pode ser ajustada)

            // Envolve o texto selecionado com o elemento span
            var range = selection.getRangeAt(0);
            range.surroundContents(span);
        }
    }
  </script>
</html>