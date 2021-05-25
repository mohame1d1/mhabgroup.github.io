
    <div class="tab">
      <a href="{$USR}orders/index"><button {if !isset($orders)} class="tablinks active"{/if}><div class="fa fa-dashboard"></div> {$_DASHBOARD}</button></a>
      <a href="{$USR}orders/ptc"><button {if isset($orders)} class="tablinks active"{/if}><div class="fa fa-eye"></div> {$_PTC_ADS}</button></a>
      <a href="#"><button {if isset($banners)} class="tablinks active"{/if}><div class="fa fa-image"></div> {$_BANNERS_ADS}</button></a>
    </div>
    <hr>