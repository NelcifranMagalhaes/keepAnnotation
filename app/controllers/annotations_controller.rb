class AnnotationsController < ApplicationController
  # GET /annotations
  def index
      @pagy, @annotations = pagy(Annotation.order(created_at: :desc), page: params[:page])
      render json: { links: @pagy.urls_hash, data: @annotations }, status: :ok
  end

  # GET /annotations/1
  def show
    use_case = Annotations::Show.new(params[:id]).call

    if use_case.failure?
      render json: { errors: use_case.errors }, status: :not_found
      return
    end

    render json: use_case.annotation, status: :ok
  end

  # POST /annotations
  def create
    use_case = Annotations::Create.new(annotation_params).call

    if use_case.failure?
      render json: { errors: use_case.errors }, status: :unprocessable_entity
      return
    end

    render json: use_case.annotation, status: :created, location: use_case.annotation
  end

  # PATCH/PUT /annotations/1
  def update
    use_case = Annotations::Update.new(params[:id], annotation_params).call

    if use_case.failure?
      render json: { errors: use_case.errors }, status: :unprocessable_entity
      return
    end

    render json: use_case.annotation, status: :ok
  end

  # DELETE /annotations/1
  def destroy
    use_case = Annotations::Delete.new(params[:id]).call

    if use_case.failure?
      render json: { errors: use_case.errors }, status: :not_found
      return
    end

    render json: {}, status: :no_content
  end

  private

  # Only allow a list of trusted parameters through.
  def annotation_params
    params.expect(annotation: [ :title, :content ]).to_h
  end
end
