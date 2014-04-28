Sequel.migration do
  up do
    create_table(:dogs) do
      primary_key :id
      String :breed
      String :color
      String :size
    end
  end

  down do
    drop_table(:dogs)
  end
end