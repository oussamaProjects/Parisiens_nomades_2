{**
* 2007-2017 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License 3.0 (AFL-3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* https://opensource.org/licenses/AFL-3.0
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
* @author    PrestaShop SA <contact@prestashop.com>
* @copyright 2007-2017 PrestaShop SA
* @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
* International Registered Trademark & Property of PrestaShop SA
*}


<div class="offset-md-2 col-md-8">
  <section class="login-form">
    <form action="{$urls.pages.contact}" method="post" {*{if $contact.allow_file_upload}enctype="multipart/form-data"{/if}*}>

      <header>
        <div class="contact_titre">
          <div>{l s='A question ? A problem ? ' d='Modules.Contactform.Shop'}</div>
          <div>{l s='Fill out the form below and we will' d='Modules.Contactform.Shop'}</div>
          <div>{l s='get back to you as soon as possible!' d='Modules.Contactform.Shop'}</div>
        </div>
      </header>

      {if $notifications}
        <div class="notification {if $notifications.nw_error}notification-error{else}notification-success{/if}">
          <ul>
            {foreach $notifications.messages as $notif}
              <li>{$notif}</li>
              {break}
            {/foreach}
          </ul>
        </div>
      {/if}

      <section class="form-fields">

        <div class="form-group"> 
          <input type="text" name="lastname" value="{$contact.lastname}" class="form-control" placeholder="{l s='Last name' d='Modules.Contactform.Shop'}" required="required" />
        </div>

        <div class="form-group"> 
          <input type="text" name="firstname" value="{$contact.firstname}" class="form-control" placeholder="{l s='First name' d='Modules.Contactform.Shop'}" required="required" />
        </div>

        <div class="form-group"> 
          <input type="email" name="from" value="{$contact.email}" class="form-control" placeholder="{l s='Email address' d='Modules.Contactform.Shop'}" required="required" />
        </div>

        <div class="form-group"> 
          <input type="text" name="phone" value="{$contact.phone}" class="form-control" placeholder="{l s='Phone' d='Modules.Contactform.Shop'}" required="required"/>
        </div>

        {if $contact.orders}
          <div class="form-group">
            <span>{l s='Order reference' d='Modules.Contactform.Shop'}</span>
            <select name="id_order" class="form-control">
              <option value="">{l s='Select reference' d='Modules.Contactform.Shop'}</option>
              {foreach from=$contact.orders item=order}
                <option value="{$order.id_order}">{$order.reference}</option>
              {/foreach}
            </select>
          </div>
        {/if}

        {* {if $contact.allow_file_upload}
          <div class="form-group">
            <span>{l s='Attach File' d='Modules.Contactform.Shop'}</span>
            <input type="file" name="fileUpload" class="form-control" />
          </div>
        {/if} *}

        <div class="form-group"> 
          <select name="id_contact" class="form-control">
            {foreach from=$contact.contacts item=contact_elt}
              <option value="{$contact_elt.id_contact}">{$contact_elt.name}</option>
            {/foreach}
          </select>
        </div>

        <div class="form-group">
          <textarea cols="67" rows="10" name="message" class="form-control" placeholder="{l s='Message' d='Modules.Contactform.Shop'}" required="required">{if $contact.message}{$contact.message}{/if}</textarea>
        </div>
        
        <div class="form-group">
          <div class="g-recaptcha" data-sitekey="6Lc8Rj4UAAAAAEuMW-UoAM9xHKc8UCKVGTQ0W-Vi"></div>
        </div>

      </section>

      <footer class="form-footer">
        <div class="form-group"> 
          <button type="submit" name="submitMessage" class="btn btn-black">
            {l s='Send' d='Modules.Contactform.Shop'}
          </button>
        </div>
      </footer>

    </form>
  </section>
</div>

<div class="clearfix"></div>

<div id="block-reassurance" class="block-reassurance block-reassurance-contact">  

  <div class="block-reassurance-item col-md-4">
    <i class="fa fa-map-marker" aria-hidden="true"></i>
    <div class="title">{l s='Adresse' d='Shop.Theme.Global'} </div>
    <div class="description">  
      <span>{$shop.address.address1}</span> <br>
      <span>{$shop.address.address2}</span> <br>
      <span>{$shop.address.city}</span>  
    </div>
  </div> 

  <div class="block-reassurance-item col-md-4">
    <i class="fa fa-phone" aria-hidden="true"></i>
    <div class="title">{l s='Téléphone' d='Shop.Theme.Global'} </div>
    <div class="description"> 
      <span>{$shop.phone}</span> 
    </div>
  </div> 

  {* <div class="block-reassurance-item col-md-4">
    <i class="fa fa-fax" aria-hidden="true"></i>
    <div class="title">{l s='Fax' d='Shop.Theme.Global'} </div>
    <div class="description">  
      <span>{$shop.fax}</span> 
    </div>
  </div>  *}

  <div class="block-reassurance-item col-md-4">
    <i class="fa fa-envelope" aria-hidden="true"></i>
    <div class="title">{l s='E-mail' d='Shop.Theme.Global'} </div>
    <div class="description">{$shop.email}</div>
  </div>

  <div class="clearfix"></div>

</div>

<div class="col-md-12"> 
  <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d809.1851779268424!2d-5.843881170759447!3d35.781745086732144!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zMzXCsDQ2JzU0LjMiTiA1wrA1MCczNi4wIlc!5e0!3m2!1sfr!2s!4v1516188011482" width="100%" height="320" frameborder="0" style="border:0" allowfullscreen></iframe>
</div> 
<div class="col-md-12"> 
<br>
<br>
</div> 