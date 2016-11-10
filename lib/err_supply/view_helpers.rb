module ErrSupply
  module ViewHelpers

    # Converts the given object's error hash into our JSON structure and
    # triggers a custom event on the associated form element.
    #
    def err_supply(obj, options={})
      form_css_selector = options[:form_css_selector]

      if form_css_selector.blank?
        id = obj.new_record? ? dom_id(obj) : dom_id(obj, :edit)
        form_css_selector = "##{id}"
      end

      prefix  = obj.class.name.underscore.split('/').last
      payload = err_supply_hash(obj, options.merge({ :prefix => prefix }))

      "$('#{ form_css_selector }').trigger('err_supply:loaded', #{ payload.to_json });".html_safe
    end

  end
end
