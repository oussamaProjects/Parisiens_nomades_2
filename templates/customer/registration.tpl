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
{extends file='page.tpl'}

{block name='page_title'}
  <div class="intro">
    <div class="logo_container">
      <img class="logo img-responsive" src="{$shop.logo}" alt="{$shop.name}">
    </div>    
    <div class="intro-titre">{l s='Grossiste & sourcing en produits de mode' d='Shop.Theme.Customeraccount'}</div>
    <div class="intro-sous-titre">{l s='Site réservé aux professionnels' d='Shop.Theme.Customeraccount'}</div>
  </div>
{/block}

{block name='page_content'}
    {block name='register_form_container'}
      <div class="float_form">
        {$hook_create_account_top nofilter}
        <div class="row">
          <div class="col-xl-10 offset-xl-1">
            <section class="register-form">
              <p>{l s='Already have an account?' d='Shop.Theme.Customeraccount'} <a href="{$urls.pages.authentication}">{l s='Log in instead!' d='Shop.Theme.Customeraccount'}</a></p>
              {render file='customer/_partials/customer-form.tpl' ui=$register_form}
            </section>
          </div>
        </div>
      </div
    {/block}
{/block}
