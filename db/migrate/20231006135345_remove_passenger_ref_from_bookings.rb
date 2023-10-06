class RemovePassengerRefFromBookings < ActiveRecord::Migration[7.0]
  def change
    remove_reference :bookings, :passenger, foreign_key: { on_delete: :cascade }
  end
end
