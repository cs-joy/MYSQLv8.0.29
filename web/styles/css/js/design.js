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
    margin-left: 10px;
  }

  .btnStyle:hover {
    color: #092e3d;
    background: #fff;
  }

  `;
  document.head.appendChild(style);