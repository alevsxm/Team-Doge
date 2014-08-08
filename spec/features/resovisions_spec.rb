require 'rails_helper'

describe "Resovisions", js: true do

  it "shows Res-o-vision when visiting the homepage" do
    visit(root_path)
    expect(page).to have_content("Resovisions")
  end

end
