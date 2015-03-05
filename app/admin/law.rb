ActiveAdmin.register Law do
  permit_params :title, :description, :status

   form do |f|
    f.inputs "Law" do
      f.input :title
      f.input :description
    end
    f.inputs "Status" do
      f.input :status
    end
    f.actions
  end
end
