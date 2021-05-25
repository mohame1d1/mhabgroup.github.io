
    <div class="tab">
      <a href="{$ADM}users/index"><button {if isset($members)} class="tablinks active"{/if}><i class="fa fa-users"></i> Users</button></a>
      <a href="{$ADM}users/referrals"><button {if isset($referrals)} class="tablinks active"{/if}><i class="fa fa-user-plus"></i> Referrals</button></a>
      <a href="{$ADM}users/top"><button {if isset($topusers)} class="tablinks active"{/if}><i class="fa fa-fire"></i> Top Users</button></a>
      <a href="{$ADM}users/add"><button {if !isset($members) && !isset($referrals)&& !isset($topusers)} class="tablinks active"{/if}><i class="fa fa-plus-circle"></i> Add User</button></a>
    </div>
    <hr>
    