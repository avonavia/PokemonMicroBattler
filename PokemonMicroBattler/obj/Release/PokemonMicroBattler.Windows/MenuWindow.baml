   M S B A M L   `   `   `  ����   PokemonMicroBattler$    PokemonMicroBattler.MenuWindow   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006       � WindowStartupLocation$  CenterScreen=� � WindowState$ Normal=� � 
ResizeMode$ CanResizeWithGrip=� � SizeToContent$ Manual=� � Title$
 Menu��$	��500��$	��800�� � 	Resources    NormalHover �� 
TargetType �� Property �� Value	 �� 
TargetType
 �� Triggers P� Property P� Value��%  &	        �� " ��.���  �@�OverridesDefaultStyle . ��  �@�Cursor$
 Hand����  � �� �� "	 ��.R��� $��border��$��0q�
���   �#��z��._��� $��Center=�$��Center=�
 P�  �@J�IsMouseOver . . ���  �@J�Opacity$	 0.8Q�.��� -    �Name$ MainGrid������  �� ImageSource$? 9/PokemonMicroBattler.Templates/Backgrounds/background.jpg�� j� Stretch$
 Fill=� � RowDefinitions �� $
��Auto ��� $
��Auto ��� $��* � � ColumnDefinitions �� �� $
��Auto ��� .+��� -    ��Name$
 Logo��$��Center=�$	��Top=�$I��C/PokemonMicroBattler.Templates/Other/logo_new_transparent_small.png��$
��None=�$��0��$��1���� -    ��Name$ PokedexButton��$	��102��$
��Left=�$��Bottom=�$	��107��#��[  $��1��$��1����Z�  J� Effect 3  -System.Windows.Media.Effects.DropShadowEffect  ���� $6 0/PokemonMicroBattler.Templates/Other/pokedex.png���� -   $ BattleButton��$	��102��$	��107��$��Right=�$��Bottom=�#��[  $��1��$��1����Z�    ���� $5 //PokemonMicroBattler.Templates/Other/battle.png���� -   $ 	LogButton��$��30��$��30��$
��Left=�$��Bottom=�#��[  $��1��$��2����Z�    ���� $7 1/PokemonMicroBattler.Templates/Other/notebook.png���� -   $ SettingsButton��$��70��$��70��$
��Left=�$	��Top=�#��[  $��0��$��0����Z�    ���� $7 1/PokemonMicroBattler.Templates/Other/settings.png��