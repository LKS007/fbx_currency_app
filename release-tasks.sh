echo "Running Release Tasks"

echo "Running Migrations"
bundle exec rails db:migrate

echo "Seeding DB"
bundle exec rails db:seed
