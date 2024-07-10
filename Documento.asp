
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
        <button id="btnSave">Save</button>
      </div>
      <div class="box">
        <div id="font-family">
          <p>Arial</p>
          <i class="fa-solid fa-arrow-down"></i>
        </div>
        <div id="txt-height">
            <button onCLick="diminuirFonte(this)">-</button>
            <input type="text" value="4" onchange="tamFonte(this.value)"/>
            <button onCLick="aumentarFonte(this)">+</button>
        </div>
      </div>
      <div class="box">
        <button id="underline" class="font">
            <i class="fa-solid fa-underline"></i>
        </button>
        <button id="italic" class="font">
            <i class="fa-solid fa-italic"></i>
        </button>
        <button id="bold" class="font">
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
    
    <div name="doc" id="doc" contentEditable="true">
     Quando se <span style="font-weight:bold">aproximaram de Jerusalém e chegaram a <span style="font-style:italic">Betfagé e Betânia</span>, junto ao monte das Oliveiras </span>
    </div>
  </body>
  <script defer>
    // console.log(document.querySelector("#doc"));
    
    
    


    // Espera até o iframe carregar completamente
    
  </script>
</html>