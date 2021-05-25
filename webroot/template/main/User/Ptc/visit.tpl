<!DOCTYPE html>
<html>
<head>
      <title>{$ptcname} - {$name}</title>
      <style type="text/css">
      {literal}
       ul{padding: 14px}
       li{list-style: none;display: inline;}
       .navi{background: #222;}
       .bar {border: 1px solid #666;height: 20px; width: 100%;
       .in {animation: fill 20s linear 1;height: 100%;background-color: pink;}}
       @keyframes fill {0% {width: 0%;}100% {width: 100%;}}
       #container {margin: 20px; width: 200px;height: 8px;}
       html body {background-color: #4c4c4c;}
       .container-footer {background-color: #115CB0;color: #ffffff;}
      {/literal}
      </style>
        <!-- App css -->
      <link href="{$AST}css/bootstrap.min.css" rel="stylesheet" type="text/css" />
      <link href="{$AST}css/core.css" rel="stylesheet" type="text/css" />
      <link href="{$AST}css/components.css" rel="stylesheet" type="text/css" />
      <link href="{$AST}css/icons.css" rel="stylesheet" type="text/css" />
      <link href="{$AST}css/pages.css" rel="stylesheet" type="text/css" />
      <link href="{$AST}css/menu.css" rel="stylesheet" type="text/css" />
      <link href="{$AST}css/responsive.css" rel="stylesheet" type="text/css" />
      <script type="text/javascript" src="{$AST}js/progressbar.js"></script>

</head>
<body>
         <div style="background-color: #4c4c4c;height: 80px;">
          <ul> 
              <li>
                  {do_ad_display('468x60')}
              </li>
              <li id="container"></li>
              <li id="proceed" style="display: none;">
               <a href="{$USR}ptc/index?id={$verify}" class="btn btn-primary btn-xs"> {$_VERIFY}</a>
              </li>
          </ul>
         </div>
         <div class="container-footer">
	        <strong>{$_AD_TITLE}</strong> <small>{$ptcname}</small> | <strong>{$_AD_URL}</strong> <small>{$ptcurl}</small>
	        <a href="javascript:;" title="Close window" onclick="window.close()"><i class="fa fa-times" style="color: #ffffff;"></i></a>
        </div>
         <iframe src="{$ptcurl}" width="100%" height="1000px" frameborder="0"></iframe>

 <script type="text/javascript" src="//code.jquery.com/jquery-1.10.2.js"></script>
 <script type="text/javascript">
  $('#proceed').delay({$timer}000).show(0);   
</script>
 <script type="text/javascript">
 var bar = new ProgressBar.Line(container,{
  strokeWidth: 1,
  easing: 'easeInOut',
  duration: {$timer}000,
  color: '#10244f',
  trailColor: '#f3f3f3',
  trailWidth: 1,
  {literal} 
   svgStyle: {width: '250px', height: '10px'} 
  {/literal}
 });

  bar.animate(1.0);  // Number from 0.0 to 1.0
 </script>

</body>
</html>