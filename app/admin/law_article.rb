ActiveAdmin.register LawArticle do
  permit_params :article_number, :status, :law_id

  form do |f|
    f.inputs "Article" do
      f.input :law
      f.input :article_number
    end
    f.inputs "Status" do
      f.input :status
    end
    f.actions
  end
end
