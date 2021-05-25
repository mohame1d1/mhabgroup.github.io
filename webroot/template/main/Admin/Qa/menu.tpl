
    <div class="tab">
      <a href="{$ADM}qa/index"><button {if isset($qalist)} class="tablinks active"{/if}><i class="fa fa-question-circle"></i> QA</button></a>
      <a href="{$ADM}qa/claims"><button {if isset($claims)} class="tablinks active"{/if}><i class="fa fa-mouse-pointer left"></i> Claims</button></a>
      <a href="{$ADM}qa/add"><button {if !isset($qalist) && !isset($claims)} class="tablinks active"{/if}><i class="fa fa-plus-circle"></i> Add QA</button></a>
    </div>
    <hr>