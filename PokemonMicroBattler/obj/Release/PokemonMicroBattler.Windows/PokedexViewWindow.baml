   M S B A M L   `   `   `  ���� N  JPokemonMicroBattler, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullq=clr-namespace:PokemonMicroBattler.PokemonMicroBattler.Windows/PokemonMicroBattler.PokemonMicroBattler.Windows  G    APokemonMicroBattler.PokemonMicroBattler.Windows.PokedexViewWindow   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     Olocal=clr-namespace:PokemonMicroBattler.PokemonMicroBattler.Windows     U QWpfAnimatedGif, Version=2.0.0.0, Culture=neutral, PublicKeyToken=9e7cd3b544a090dc,gif"http://wpfanimatedgif.codeplex.com    � WindowStartupLocation$  CenterScreen=� � WindowState$ Normal=� � 
ResizeMode$ CanResizeWithGrip=� � SizeToContent$ Manual=� � Title$ Pokemon Info��$	��500��$	��800�� � 	Resources    NormalHover �� 
TargetType �� Property �� Value	 �� 
TargetType
 �� Triggers P� Property P� Value��%  &	        �� " ��.���  �@�OverridesDefaultStyle . ��  �@�Cursor$
 Hand����  � �� �� "	 ��.R��� $��border��$��0q�
���   �#��z��._��� $��Center=�$��Center=�
 P�  �@J�IsMouseOver . . ���  �@J�Opacity$	 0.8Q�.��� -    �Name$ MainGrid������  �� ImageSource$> 8/PokemonMicroBattler.Templates/Backgrounds/pokedexUi.png�� j� Stretch$
 Fill=� � ColumnDefinitions �� �� �� �� �� �� �� ��  � RowDefinitions �� �� �� �� �� �� �� �� �� �� .+��� -    ��Name$ PokeImg��$��Center=�$	��Top=�$��1��$��2��$��2��$��3��$��0,0,70,0q��� -    ��Name$ 	NameBlock�� �� TextAlignment$
 Left=�$��25��$��4��$��3��$��1��$��Showcard Gothic)�$��20(��� -   $ 	DescBlock��$
��Wrap=�$��1��$��6��$��7��$��2��$��Showcard Gothic)�$��15(��� -   $ HeightBlock��$��10,0,0,0q�$��Center=�$
��Left=�$��2��$��6��$��4��$��Showcard Gothic)�$��20(��� -   $ WeightBlock��$��10,0,0,0q�$��Center=�$
��Left=�$��2��$��6��$��5��$��Showcard Gothic)�$��20(��� -   $ 
LevelBlock��$��Bottom=�$��Right=�$ Right=�$��3��$��3��$��2��$��Showcard Gothic)�$��50(��� -   $ 
Type1Block��$ Center=�$��4��$��2��$��Showcard Gothic)�$��20(��� -	   $ 
Type2Block��$ Center=�$��6��$��2��$��Showcard Gothic)�$��20(��� -
    ��Name$ 
BackButton��#��[  $��0,0,0,10q���Z� ���� $4 ./PokemonMicroBattler.Templates/Other/arrow.png��$ Uniform=�