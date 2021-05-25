
    <div class="tab">
      <a href="{$ADM}ptc/index"><button {if isset($ptclinks)} class="tablinks active"{/if}><div class="fa fa-eye"></div> PTC</button></a>
      <a href="{$ADM}ptc/claims"><button {if isset($claims)} class="tablinks active"{/if}><div class="fa fa-mouse-pointer left"></div> Claims</button></a>
      <a href="{$ADM}ptc/add"><button {if !isset($ptclinks) && !isset($claims)} class="tablinks active"{/if}><div class="fa fa-plus-circle"></div> Add PTC</button></a>
    </div>
    <hr>