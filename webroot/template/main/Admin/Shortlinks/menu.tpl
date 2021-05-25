    
    <div class="tab">
      <a href="{$ADM}shortlinks/index"><button {if isset($shortlinks)} class="tablinks active"{/if}><i class="fa fa-link"></i> Shortlinks</button></a>
      <a href="{$ADM}shortlinks/claims"><button {if isset($claims)} class="tablinks active"{/if}><i class="fa fa-mouse-pointer left"></i> Claims</button></a>
      <a href="{$ADM}shortlinks/add"><button {if !isset($shortlinks) && !isset($claims)} class="tablinks active"{/if}><i class="fa fa-plus-circle"></i> Add Shortlink</button></a>
    </div>
    <hr>