
    <div class="tab">
      <a href="{$ADM}ads/index"><button {if isset($ads)} class="tablinks active"{/if}><div class="fa fa-code"></div> Ads</button></a>
      <a href="{$ADM}ads/add"><button {if !isset($ads)} class="tablinks active"{/if}><div class="fa fa-plus-circle"></div> Add AD</button></a>
    </div>
    <hr>