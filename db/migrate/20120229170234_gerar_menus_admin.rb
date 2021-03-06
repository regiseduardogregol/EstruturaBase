# coding: utf-8
class GerarMenusAdmin < ActiveRecord::Migration
  def self.up
    #create menu
    m = Menu.create!(:name => "Menus", :adm => true)

    Menu.transaction do
      m.sub_menus.create!(:name => "Cadastrar Menu", :url => "/admin/menus/new",
          :title =>  "Clique aqui para cadastrar um novo menu", :position => 0,
          :adm => true) rescue nil

      m.sub_menus.create!(:name => "Listar Menus", :url => "/admin/menus",
          :title =>  "Clique aqui para listar os menus", :position => 1,
          :adm => true) rescue nil

      m.sub_menus.create!(:name => "Ordenar Menus", :url => "/admin/menus/ordenar_menus",
          :title =>  "Clique aqui para ordenar os menus", :position => 2,
          :adm => true, :separator => true) rescue nil

      m.sub_menus.create!(:name => "Cadastrar Sub-Menu", :url => "/admin/sub_menus/new",
              :title =>  "Clique aqui para cadastrar um novo sub-menu", :position => 3,
              :adm => true) rescue nil
      m.sub_menus.create!(:name => "Listar Sub-Menus", :url => "/admin/sub_menus",
              :title =>  "Clique aqui para listar os menus", :position => 4,
              :adm => true) rescue nil

      m.sub_menus.create!(:name => "Ordenar Sub-Menus", :url => "/admin/sub_menus/ordenar_sub_menus",
          :title =>  "Clique aqui para ordenar os sub-menus", :position => 5,
          :adm => true) rescue nil
    end

    #create roles
    m = Menu.create!(:name => "Permissões", :position => 1, :adm => true)

    Menu.transaction do
      #create acess_type
      m.sub_menus.create!(:menu_id => m.id, :name => "Cadastrar Tipos de Acesso", :url => "/admin/tipos_acesso/new",
          :title =>  "Clique aqui para cadastrar um novo tipo de acesso", :position => 0, :adm => true) rescue nil
      m.sub_menus.create!(:menu_id => m.id, :name => "Listar Tipos de Acesso", :url => "/admin/tipos_acesso",
          :title => "Clique aqui para listar os tipos de acesso", :position => 1, :separator => true, :adm => true) rescue nil

      #create permission
      m.sub_menus.create!(:menu_id => m.id, :name => "Cadastrar Permissão", :url => "/admin/permissoes/new",
          :title => "Clique aqui para cadastrar uma nova permissão", :position => 2, :adm => true) rescue nil
      m.sub_menus.create!(:menu_id => m.id, :name => "Listar Permissões", :url => "/admin/permissoes",
          :title => "Clique aqui para listar as permissões", :position => 3, :adm => true, :separator => true) rescue nil

      #create menu_permissions
      m.sub_menus.create!(:menu_id => m.id, :name => "Cadastrar Menu/Permissão", :url => "/admin/menu_permissoes/new",
          :title => "Clique aqui para cadastrar um novo menu/permissão", :position => 4, :adm => true) rescue nil
      m.sub_menus.create!(:menu_id => m.id, :name => "Listar Menu/Permissões", :url => "/admin/menu_permissoes",
          :title => "Clique aqui para listar menus/permissões", :position => 5, :adm => true, :separator => true) rescue nil

      #create sub_permissions
      m.sub_menus.create!(:menu_id => m.id, :name => "Cadastrar Sub-Menu/Permissão", :url => "/admin/sub_menu_permissoes/new",
          :title => "Clique aqui para cadastrar um novo sub-menus/permissão", :position => 6, :adm => true) rescue nil
      m.sub_menus.create!(:menu_id => m.id, :name => "Listar Sub-Menus/Permissões", :url => "/admin/sub_menu_permissoes",
          :title => "Clique aqui para listar sub-menus/permissões", :position => 7, :adm => true) rescue nil
    end

    Role.create!(:name => "Administrador", :value => 5)
    Role.create!(:name => "Moderador", :value => 3)

    #create four_oh_four
    m = Menu.create!(:name => "Rotas/Erros", :position => 2, :adm => true)
    Menu.transaction do
      m.sub_menus.create!(:menu_id => m.id, :name => "Listagem de rotas erradas", :url => "/admin/rotas_erradas",
          :title =>  "Clique aqui para visualizar as rotas erradas", :position => 0, :adm => true) rescue nil

      m.sub_menus.create!(:menu_id => m.id, :name => "Listar Erros", :url => "/admin/erros",
          :title => "Clique aqui para listar os erros", :position => 1, :adm => true) rescue nil
    end


    #create menu location
    m = Menu.create!(:name => "Localização",:position => 4,:adm => true)
    Menu.transaction do
      m.sub_menus.create!(:menu_id => m.id, :name => "Cadastrar Localização", :url => "/admin/locations/new",
          :title => "Clique aqui para cadastrar um(a) novo(a) localização", :position => 0) rescue nil
      m.sub_menus.create!(:menu_id => m.id, :name => "Listar localização", :url => "/admin/locations",
          :title => "Clique aqui para listar os(as) localização", :position => 1) rescue nil
    end



    #create user
    m = Menu.create!(:name => "Usuários", :position => 3, :adm => true)
    Menu.transaction do
      m.sub_menus.create!(:menu_id => m.id, :name => "Cadastrar Usuário", :url => "/admin/usuarios/new",
          :title =>  "Clique aqui para cadastrar um novo usuário", :position => 0) rescue nil
      m.sub_menus.create!(:menu_id => m.id, :name => "Listar Usuários", :url => "/admin/usuarios",
          :title => "Clique aqui para listar os usuários", :position => 1) rescue nil
      m.sub_menus.create!(:menu_id => m.id, :name => "Alterar Meus Dados", :url => "/admin/usuarios/alterar_meus_dados",
          :title => "Clique aqui para alterar seus dados", :position => 2) rescue nil
    end

    User.create!(:name => "Administrador", :username => "admin", :email => "admin@admin.com",
                   :password => "administrador",
                   :role_id => 1)
  end

  def self.down
    Menu.delete_all
  end
end

