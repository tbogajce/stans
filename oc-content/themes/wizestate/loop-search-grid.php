<?php

$type = 'items';
if(View::newInstance()->_exists('listType')){
    $type = View::newInstance()->_get('listType');
}

?>
<div id="listing-card-list" class="listing-card-list listings_grid listings_grids">
<?php
	// premium items
	if($type == 'premiums'){
		$listcount = 0;
?>
<ul class="row premium_search">
<?php
		while ( osc_has_premiums() ) {
	?>
<?php $size = explode('x', osc_thumbnail_dimensions()); ?>
<li class="col-sm-6 col-md-4 listing-card premium">
  <article class="loop_premium">
    <div class="figure">
      <figure>
        <?php if( osc_images_enabled_at_items() ) { ?>
        <?php if(osc_count_premium_resources()) { ?>
        <a class="listing-thumb" href="<?php echo osc_premium_url() ; ?>" title="<?php echo osc_esc_html(osc_premium_title()) ; ?>"><img class="img-responsive" src="<?php echo osc_resource_thumbnail_url(); ?>" title="" alt="<?php echo osc_esc_html(osc_premium_title()) ; ?>" width="<?php echo $size[0]; ?>" height="<?php echo $size[1]; ?>"></a>
        <?php } else { ?>
        <a class="listing-thumb" href="<?php echo osc_premium_url() ; ?>" title="<?php echo osc_esc_html(osc_premium_title()) ; ?>"><img class="img-responsive" src="<?php echo osc_current_web_theme_url('images/no_photo.gif'); ?>" title="" alt="<?php echo osc_esc_html(osc_premium_title()) ; ?>" width="<?php echo $size[0]; ?>" height="<?php echo $size[1]; ?>"></a>
        <?php } ?>
        <?php } ?>
        <span class="ribbon"> <i class="fa fa-star"></i> </span> <span class="onsale_wiz"> <?php echo osclasswizards_realEstate_type(osc_premium_ID());?> </span></figure>
    </div>
    <div class="listing-attr">
      <div class="info_top">
        <h4><a href="<?php echo osc_premium_url() ; ?>" title="<?php echo osc_esc_html(osc_premium_title()) ; ?>"><?php echo osc_highlight(strip_tags(osc_premium_title()),40) ; ?></a></h4>
        <span class="location"><i class="fa fa-map-marker"></i><?php echo osc_premium_city(); ?>
        <?php if(osc_premium_region()!='') { ?>
        (<?php echo osc_premium_region(); ?>)
        <?php } ?>
        </span>
        <?php if( osc_price_enabled_at_items() ) { ?>
        <span class="currency-value"><?php echo osc_format_price(osc_premium_price(), osc_premium_currency_symbol()); ?></span>
        <?php } ?>
        <span class="wiz_area"> <strong>
        <?php _e('Area:',OSCLASSWIZARDS_THEME_FOLDER);?>
        </strong> <?php echo osclasswizards_realEstate_area(osc_premium_ID());?> </span>
        <div class="clear_state"> <span class="wiz_floors"><strong>
          <?php _e('Floors:',OSCLASSWIZARDS_THEME_FOLDER);?>
          </strong> <?php echo osclasswizards_realEstate_floors(osc_premium_ID());?> </span> <span class="wiz_rooms"> <strong>
          <?php _e('Rooms:',OSCLASSWIZARDS_THEME_FOLDER);?>
          </strong> <?php echo osclasswizards_realEstate_rooms(osc_premium_ID());?> </span> <span class="wiz_bathrooms"> <strong>
          <?php _e('Shower:',OSCLASSWIZARDS_THEME_FOLDER);?>
          </strong> <?php echo osclasswizards_realEstate_bathrooms(osc_premium_ID());?> </span> </div>
      </div>
      <?php $admin = false; ?>
      <?php if($admin){ ?>
      <span class="admin-options"> <a href="<?php echo osc_premium_edit_url(); ?>" rel="nofollow">
      <?php _e('Edit item', OSCLASSWIZARDS_THEME_FOLDER); ?>
      </a> <span>|</span> <a class="delete" onclick="javascript:return confirm('<?php echo osc_esc_js(__('This action can not be undone. Are you sure you want to continue?', OSCLASSWIZARDS_THEME_FOLDER)); ?>')" href="<?php echo osc_premium_delete_url();?>" >
      <?php _e('Delete', OSCLASSWIZARDS_THEME_FOLDER); ?>
      </a>
      <?php if(osc_premium_is_inactive()) {?>
      <span>|</span> <a href="<?php echo osc_premium_activate_url();?>" >
      <?php _e('Activate', OSCLASSWIZARDS_THEME_FOLDER); ?>
      </a>
      <?php } ?>
      </span>
      <?php } ?>
    </div>
  </article>
</li>
<?php
            }
			echo '</ul>';
        }
		else {
			echo '<ul class="wizards row">';

            while(osc_has_items()) {
	

		$admin = false;
                if(View::newInstance()->_exists("listAdmin")){
                    $admin = true;
                }
?>
<?php $size = explode('x', osc_thumbnail_dimensions()); ?>
<li class="item listing-card col-sm-6 col-md-4 <?php if(osc_item_is_premium()){ echo ' premium'; } ?>">
  <div class="figure">
    <figure>
      <?php if( osc_images_enabled_at_items() ) { ?>
      <?php if(osc_count_item_resources()) { ?>
      <a class="listing-thumb" href="<?php echo osc_item_url() ; ?>" title="<?php echo osc_esc_html(osc_item_title()) ; ?>"><img src="<?php echo osc_resource_thumbnail_url(); ?>" title="" alt="<?php echo osc_esc_html(osc_item_title()) ; ?>" width="<?php echo $size[0]; ?>" height="<?php echo $size[1]; ?>" class="img-responsive"></a>
      <?php } else { ?>
      <a class="listing-thumb" href="<?php echo osc_item_url() ; ?>" title="<?php echo osc_esc_html(osc_item_title()) ; ?>"><img src="<?php echo osc_current_web_theme_url('images/no_photo.gif'); ?>" title="" alt="<?php echo osc_esc_html(osc_item_title()) ; ?>" width="<?php echo $size[0]; ?>" height="<?php echo $size[1]; ?>" class="img-responsive"></a>
      <?php } ?>
      <?php } ?>
      <span class="ribbon"> <i class="fa fa-star"></i> </span> <span class="onsale_wiz"> <?php echo osclasswizards_realEstate_type(osc_item_ID());?> </span></figure>
  </div>
  <div class="listing-attr">
    <div class="info_top">
      <h4><a href="<?php echo osc_item_url() ; ?>" title="<?php echo osc_esc_html(osc_item_title()) ; ?>"><?php echo osc_highlight(strip_tags(osc_item_title()),40) ; ?></a></h4>
      <span class="location"><i class="fa fa-map-marker"></i><?php echo osc_item_city(); ?>
      <?php if( osc_item_region()!='' ) { ?>
      (<?php echo osc_item_region(); ?>)
      <?php } ?>
      </span>
      <?php if( osc_price_enabled_at_items() ) { ?>
      <span class="currency-value"><?php echo osc_format_price(osc_item_price()); ?></span>
      <?php } ?>
      <span class="wiz_area"> <strong>
      <?php _e('Area:',OSCLASSWIZARDS_THEME_FOLDER);?>
      </strong> <?php echo osclasswizards_realEstate_area(osc_item_ID());?> </span>
      <div class="clear_state"> <span class="wiz_floors"><strong>
        <?php _e('Floors:',OSCLASSWIZARDS_THEME_FOLDER);?>
        </strong> <?php echo osclasswizards_realEstate_floors(osc_item_ID());?> </span> <span class="wiz_rooms"> <strong>
        <?php _e('Rooms:',OSCLASSWIZARDS_THEME_FOLDER);?>
        </strong> <?php echo osclasswizards_realEstate_rooms(osc_item_ID());?> </span> <span class="wiz_bathrooms"> <strong>
        <?php _e('Shower:',OSCLASSWIZARDS_THEME_FOLDER);?>
        </strong> <?php echo osclasswizards_realEstate_bathrooms(osc_item_ID());?> </span></div>
    </div>
    <?php if($admin){ ?>
    <span class="admin-options"> <a href="<?php echo osc_item_edit_url(); ?>" rel="nofollow">
    <?php _e('Edit item', OSCLASSWIZARDS_THEME_FOLDER); ?>
    </a> <span>|</span> <a class="delete" onclick="javascript:return confirm('<?php echo osc_esc_js(__('This action can not be undone. Are you sure you want to continue?', OSCLASSWIZARDS_THEME_FOLDER)); ?>')" href="<?php echo osc_item_delete_url();?>" >
    <?php _e('Delete', OSCLASSWIZARDS_THEME_FOLDER); ?>
    </a>
    <?php if(osc_item_is_inactive()) {?>
    <span>|</span> <a href="<?php echo osc_item_activate_url();?>" >
    <?php _e('Activate', OSCLASSWIZARDS_THEME_FOLDER); ?>
    </a>
    <?php } ?>
    </span>
    <?php } ?>
  </div>
</li>
<?php
        }
		echo '</ul>';
  }
?>
</div>
