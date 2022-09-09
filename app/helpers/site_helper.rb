module SiteHelper
    def msg_jumbotron
        case params[:action]
        when 'index'
            "Últimas perguntas cadastradas..."
        when 'questions'
            "Resultados para o termo: \'#{sanitize params[:term]}\'"
        when 'subject'
            "Perguntas filtradas por assunto: \'#{sanitize params[:subject]}\'"
        end
    end
end
