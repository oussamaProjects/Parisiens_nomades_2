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

<div id="newsletter" class="email_subscription">

  <div class="container">
    <div class="row">
      <div class="offset-lg-3 col-lg-6 offset-md-1 col-md-9">


        <div class="titre">{l s='Restez informé' d='Modules.Emailsubscription.Shop'}</div>
        <div class="desc">{l s='Inscrivez-vous à notre Newsletter' d='Modules.Emailsubscription.Shop'}</div>

        <form action="{$urls.pages.index}#newsletter" method="post" class="form">
          <input type="text" name="email" value="{$value}" placeholder="{l s='votre-email@domaine.com' d='Modules.Emailsubscription.Shop'}" />
          <input type="submit" value="{l s='s\'inscrire' d='Modules.Emailsubscription.Shop'}" name="submitNewsletter" class="btn btn-site" />
          <input type="hidden" name="action" value="0" />
        </form>

        {if $msg}
          <p class="desc notification {if $nw_error}notification-error{else}notification-success{/if}">{$msg}</p>
        {/if}

        {if $conditions}
          <p  class="desc">{$conditions}</p> 
        {/if}


      </div>
    </div>
  </div>

</div>