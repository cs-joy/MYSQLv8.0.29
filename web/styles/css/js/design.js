var style = document.createElement('style');
  style.innerHTML = `
  #box {
  color: blueviolet;
  font-size: 25px;
  text-align: center;
  }

  .update {
    margin: 50px;
    background: #080c12;
    padding: 5px 15px;
    color: #3884ff;
  }

  .limit {
    margin: 25px;
    background: #092e3d;
    padding: 2px 8px;
    color: #47cbff;
  }
  
  .lhr {
    color: #47cbff;
  }

  .btnStyle {
    background-color: #47cbff;
    font-weight: bold;
    border-radius: 5px;
    border-color: #47cbff;
    margin-top: 10px;
  }

  .btnStyle:hover {
    color: #092e3d;
    background: #fff;
  }

  .vueClass {
    margin: 25px;
    background: #48f7a2;
    padding: 2px 8px;
    color: #29281f;
  }

  .vueHr {
    color: #00122e;
  }

  #vueHeading {
    color: #092e3d;
    font-size: 25px;
    text-align: center;
    background: #fff;
    font-weight: bold;
    padding: 35px;
    margin: 35px;
  }

  .vueForm {
    padding: 25px 15px;
  }

  `;
  document.head.appendChild(style);