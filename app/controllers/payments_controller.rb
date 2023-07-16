class PaymentsController < ApplicationController
    before_action :set_payment, only: %i[ show edit update destroy ]

    # GET /payments
    def index
      @payments = Payment.all
    end

    # GET /payments/1
    def show
    end

    # GET /payments/new
    def new
      @payment = Payment.new
      @sidebar = false
    end

    # GET /payments/1/edit
    def edit
    end

    # POST /payments
    def create
      @payment = Payment.new(payment_params)
      @payment.user = current_user
      new_sub= Subscription.find(@payment.user.subscription.id)
      new_sub.subscription_type= params[:payment][:subscription_type]
      new_sub.init_date=Date.today
      new_sub.end_date=Date.today+30
      new_sub.user_id=current_user.id
      if params[:payment][:subscription_type]== "basic"
        new_sub.price_sub= 9
      new_sub.subscription_type = "basic"
      elsif params[:payment][:subscription_type]== "premium"
        new_sub.price_sub= 12
        new_sub.subscription_type = "premium"
      else
        new_sub.price_sub= 0
        new_sub.subscription_type = "trial"
      end
       @payment.subscription = new_sub


      if new_sub.save && @payment.save
        redirect_to companies_path, notice: "Payment was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /payments/1
    def update
      if @payment.update(payment_params)
        redirect_to @payment, notice: "Payment was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    # DELETE /payments/1
    def destroy
      @payment.destroy
      redirect_to payments_url, notice: "Payment was successfully destroyed.", status: :see_other
    end

    private
      # usa callbacks para compartir un setup común o cierto tipo de accionse.
      def set_payment
        @payment = Payment.find(params[:id])
      end

      # solo deja pasar ciertos atributos
      def payment_params
        params.require(:payment).permit(:subscription_id, :credit_card_number, :expiration_date, :name, :security_code, :subscription_type)
      end
end
