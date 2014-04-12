A simple blog template using Middleman. This is the Rainforest edition, with a bunch of specific branding stuff that isn't useful for other users. For the unbranded version, go to [the original repo](https://github.com/fredsterss/Simple-Blog-Boilerplate).

## Installation:

Middleman supports [project templates](http://middlemanapp.com/getting-started/#toc_6). Project templates are awesome because you can keep all the boilerplate crap in one place on your box. However, the installation process is a little involved. To install middleman-blog-project-template as a template available to your user:

1. Clone the Git repository into ``~/.middleman``, like so ``git clone https://github.com/rainforestapp/Simple-Blog-Boilerplate.git ~/.middleman/simple-blog-boilerplate``
2. Install Middleman (requires Ruby and Rubygems): ``gem install middleman``
3. Use the new template argument for the ```middleman init``` command within your projects folder, where 'my_new_project' is the name of your new project folder: ``middleman init my_new_project --template=simple-blog-boilerplate``

## Rainforest styles:
1. Add the [Rainforest shared styles](https://github.com/rainforestapp/shared-styles) into the stylesheets folder. ``cd source/stylesheets/`` then ``git clone https://github.com/rainforestapp/shared-styles.git``
2. Import the core shared styles in screen.scss: ``@import "shared-styles/import";``
3. Import the layout that matters to you, currently only fluid sidebar: ``@import "shared-styles/layouts/_fluid_sidebar";``

## Usage:

1. Ensure you have Ruby + bundler installed
2. Run ``bundle install`` from within your project directory
3. Run ``bundle exec middleman server`` and go to http://0.0.0.0:4567/
